#! /bin/sh

TEST_DIR=`dirname $0`
TOOL=../text-replacer-with-file

setUp()
{
  PREV_DIR=$PWD
  cd $TEST_DIR
  cp a.txt a.txt.bk
}

tearDown()
{
  if [ -f a.txt.bk ]; then
    mv a.txt.bk a.txt
  fi
  cd $PREV_DIR
}

testExample1()
{
  $TOOL a.txt abc b.txt > /dev/null 2>&1
  diff a.txt 1-expected.txt
  assertEquals 0 $?
}

testExample2()
{
  $TOOL a.txt abc c.txt > /dev/null 2>&1
  diff a.txt 2-expected.txt
  assertEquals 0 $?
}

testExample3()
{
  $TOOL a.txt bcd b.txt > /dev/null 2>&1
  diff a.txt 3-expected.txt
  assertEquals 0 $?
}

testExample4()
{
  $TOOL a.txt cde b.txt > /dev/null 2>&1
  diff a.txt 4-expected.txt
  assertEquals 0 $?
}

# load shunit2
. $TEST_DIR/shunit2
