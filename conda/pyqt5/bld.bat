::CALL "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" /x64

%PYTHON% configure.py ^
        --spec=win32-msvc2015 ^
        --assume-shared ^
        --verbose ^
        --confirm-license ^
        --bindir=%PREFIX%\Scripts ^
        --disable QtNfc

jom
jom install
