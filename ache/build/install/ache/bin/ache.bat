@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  ache startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and ACHE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Dname=ache -XX:+UseConcMarkSweepGC -XX:+HeapDumpOnOutOfMemoryError"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\ache-0.16.0-SNAPSHOT.jar;%APP_HOME%\lib\crawler-commons.jar;%APP_HOME%\lib\logback-classic-1.4.5.jar;%APP_HOME%\lib\crawler-commons-1.2.jar;%APP_HOME%\lib\javalin-4.2.0.jar;%APP_HOME%\lib\metrics-json-4.2.17.jar;%APP_HOME%\lib\metrics-jvm-4.2.17.jar;%APP_HOME%\lib\metrics-core-4.2.17.jar;%APP_HOME%\lib\kafka-clients-3.4.0.jar;%APP_HOME%\lib\webarchive-commons-1.1.9.jar;%APP_HOME%\lib\dsiutils-2.0.12.jar;%APP_HOME%\lib\smile-core-1.5.3.jar;%APP_HOME%\lib\smile-data-1.5.3.jar;%APP_HOME%\lib\smile-graph-1.5.3.jar;%APP_HOME%\lib\smile-math-1.5.3.jar;%APP_HOME%\lib\slf4j-api-2.0.6.jar;%APP_HOME%\lib\lingua-1.2.2.jar;%APP_HOME%\lib\airline-0.9.jar;%APP_HOME%\lib\guava-26.0-jre.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\commons-compress-1.22.jar;%APP_HOME%\lib\elasticsearch-rest-client-5.6.7.jar;%APP_HOME%\lib\httpclient-4.5.14.jar;%APP_HOME%\lib\commons-httpclient-3.1.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\commons-validator-1.7.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.14.2.jar;%APP_HOME%\lib\jackson-annotations-2.14.2.jar;%APP_HOME%\lib\jackson-core-2.14.2.jar;%APP_HOME%\lib\jackson-dataformat-cbor-2.14.2.jar;%APP_HOME%\lib\jackson-databind-2.14.2.jar;%APP_HOME%\lib\kryo-serializers-0.43.jar;%APP_HOME%\lib\kryo-4.0.2.jar;%APP_HOME%\lib\rocksdbjni-6.25.3.jar;%APP_HOME%\lib\boilerpipe-1.2.2.jar;%APP_HOME%\lib\nekohtml-1.9.22.jar;%APP_HOME%\lib\jsoup-1.15.1.jar;%APP_HOME%\lib\lucene-analyzers-common-8.11.1.jar;%APP_HOME%\lib\okhttp-4.10.0.jar;%APP_HOME%\lib\RoaringBitmap-0.9.39.jar;%APP_HOME%\lib\commons-io-2.11.0.jar;%APP_HOME%\lib\logback-core-1.4.5.jar;%APP_HOME%\lib\moshi-kotlin-1.13.0.jar;%APP_HOME%\lib\moshi-1.13.0.jar;%APP_HOME%\lib\okio-jvm-3.0.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.6.0.jar;%APP_HOME%\lib\kotlin-reflect-1.6.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.6.0.jar;%APP_HOME%\lib\kotlin-stdlib-1.6.21.jar;%APP_HOME%\lib\fastutil-8.5.8.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\error_prone_annotations-2.1.3.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\commons-beanutils-1.9.4.jar;%APP_HOME%\lib\commons-digester-2.1.jar;%APP_HOME%\lib\commons-configuration-1.8.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\snakeyaml-1.33.jar;%APP_HOME%\lib\reflectasm-1.11.3.jar;%APP_HOME%\lib\minlog-1.3.0.jar;%APP_HOME%\lib\objenesis-2.5.1.jar;%APP_HOME%\lib\jetty-webapp-9.4.44.v20210927.jar;%APP_HOME%\lib\websocket-server-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-servlet-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-security-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-server-9.4.44.v20210927.jar;%APP_HOME%\lib\httpcore-4.4.16.jar;%APP_HOME%\lib\httpasyncclient-4.1.2.jar;%APP_HOME%\lib\httpcore-nio-4.4.5.jar;%APP_HOME%\lib\zstd-jni-1.5.2-1.jar;%APP_HOME%\lib\lz4-java-1.8.0.jar;%APP_HOME%\lib\snappy-java-1.1.8.4.jar;%APP_HOME%\lib\json-20131018.jar;%APP_HOME%\lib\htmlparser-1.6.jar;%APP_HOME%\lib\juniversalchardet-1.0.3.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\libidn-1.15.jar;%APP_HOME%\lib\joda-time-1.6.jar;%APP_HOME%\lib\xercesImpl-2.11.0.jar;%APP_HOME%\lib\lucene-core-8.11.1.jar;%APP_HOME%\lib\shims-0.9.39.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.6.21.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\checker-qual-2.5.2.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\websocket-servlet-9.4.44.v20210927.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\websocket-client-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-client-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-http-9.4.44.v20210927.jar;%APP_HOME%\lib\websocket-common-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-io-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-xml-9.4.44.v20210927.jar;%APP_HOME%\lib\jsap-2.1.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\commons-math3-3.1.1.jar;%APP_HOME%\lib\xml-apis-1.4.01.jar;%APP_HOME%\lib\jetty-util-ajax-9.4.44.v20210927.jar;%APP_HOME%\lib\jetty-util-9.4.44.v20210927.jar;%APP_HOME%\lib\websocket-api-9.4.44.v20210927.jar


@rem Execute ache
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %ACHE_OPTS%  -classpath "%CLASSPATH%" achecrawler.Main %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable ACHE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%ACHE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
