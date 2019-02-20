---------------------------------------------------------------------------
-- common: shared configuration included at the end of other configs
---------------------------------------------------------------------------

-- change these mappings so that the first N tests use unique cores
threads =
{
  { thread = 0, cpuset = '0' },
  { thread = 1, cpuset = '1' },
  { thread = 2, cpuset = '2' },
  { thread = 3, cpuset = '3' },
  { thread = 4, cpuset = '4' },
  { thread = 5, cpuset = '5' },
  { thread = 6, cpuset = '6' },
  { thread = 7, cpuset = '7' },
  { thread = 8, cpuset = '8' },
  { thread = 9, cpuset = '9' },
  { thread = 10, cpuset = '10' },
  { thread = 11, cpuset = '11' },
  { thread = 12, cpuset = '12' },
  { thread = 13, cpuset = '13' },
  { thread = 14, cpuset = '14' },
  { thread = 15, cpuset = '15' },
}

process = { threads = threads }

search_engine.search_method = 'hyperscan'

