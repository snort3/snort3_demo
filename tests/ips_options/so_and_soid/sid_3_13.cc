//--------------------------------------------------------------------------
// Copyright (C) 2014-2024 Cisco and/or its affiliates. All rights reserved.
//
// This program is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License Version 2 as published
// by the Free Software Foundation.  You may not use, modify or distribute
// this program under any other version of the GNU General Public License.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//--------------------------------------------------------------------------
// sid_3_13.cc author Russ Combs <rucombs@cisco.com>

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <cassert>
#include <string>
#include <string.h>

#include "flow/flow.h"
#include "framework/cursor.h"
#include "framework/so_rule.h"
#include "main/snort_types.h"
#include "protocols/packet.h"

#include "sid_3_13.h"

using namespace snort;

//--------------------------------------------------------------------------
// implementation stuff
//--------------------------------------------------------------------------

class CheezFlowData : public snort::RuleFlowData
{
public:
    CheezFlowData() : RuleFlowData(id) { }

    static void pinit()
    { id = FlowData::create_flow_data_id(); }

    size_t size_of() override
    { return sizeof(*this); }

    unsigned get_id() { return id; }
    unsigned total(unsigned n) { return cans += n; }

public:
    static unsigned id;

private:
    unsigned cans = 0;
};

unsigned CheezFlowData::id = 0;

class CheezMeter
{
public:
    CheezMeter(unsigned max) : max(max) { }

    bool too_cheezy(CheezFlowData* fd, Cursor& c)
    {
        std::string s((const char*)c.start(), c.length());
        int n = std::stoi(s);
        return fd->total(n) > max;
    }

private:
    const unsigned max;
};

static IpsOption::EvalStatus eval(void* pv, Cursor& c, Packet* p)
{
    if ( !p->flow )
        return IpsOption::NO_MATCH;

    assert(pv);
    CheezMeter* cm = (CheezMeter*)pv;

    if ( !CheezFlowData::id )  // FIXIT-H hack this lazy init until pinit is called via api
        CheezFlowData::pinit();

    CheezFlowData* fd = (CheezFlowData*)p->flow->get_flow_data(CheezFlowData::id);

    if ( !fd )
    {
        fd = new CheezFlowData;
        p->flow->set_flow_data(fd);
    }

    return cm->too_cheezy(fd, c) ? IpsOption::MATCH : IpsOption::NO_MATCH;
}

//--------------------------------------------------------------------------
// api stuff
//--------------------------------------------------------------------------

static SoEvalFunc ctor(const char* key, void** pv)
{
    assert(!strncmp(key, "cans", 4));
    *pv = new CheezMeter(atoi(key + 4));
    return eval;
}

static void dtor(void* pv)
{
    assert(pv);
    delete (CheezMeter*)pv;
}

static const SoApi so_api =
{
    {
        PT_SO_RULE,
        sizeof(SoApi),
        SOAPI_VERSION,
        1,
        API_RESERVED,
        API_OPTIONS,
        "3_13_1",
        "SO rule example",
        nullptr,
        nullptr
    },
    (uint8_t*)rule_3_13_1,
    rule_3_13_1_len,
    CheezFlowData::pinit,
    nullptr, // pterm - Snort issue, you should not need to call this directly
    nullptr, // tinit
    nullptr, // tterm
    ctor,
    dtor,
};

// other snort plugins can be put in this list as needed
// eg multiple rules in one so, custom rule options, etc.
SO_PUBLIC const BaseApi* snort_plugins[] =
{
    &so_api.base,
    nullptr
};

