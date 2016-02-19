::CALL "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" /x64

%PYTHON% configure.py ^
        --verbose ^
        --spec=win32-msvc2015 ^
        --confirm-license ^
        --qmake=%PREFIX%\Library\bin\qmake-qt5 ^
        --assume-shared ^
        --bindir=%PREFIX%\Library\bin ^
        --disable QtNfc

jom
jom install
