you need to copy the file: bomex_test.py and the executeable microhh in the same directory and then to use the bomex_test.py you can use it as following:
Command,                              What it does
python run.py  ,                     "Run full Bomex case (default settings, 4 MPI)"
python run.py run_small               ,Run tiny 8×8 test case (for quick checks)
python run.py run_restart             ,Run several short restart tests with variations
python run.py run_case endtime=7200  ,Run full case but for 2 hours instead of default
