# Text Replacer with File

## Installation

Copy `text-replacer-with-file` to a directory that is in your PATH.

## Usage

```sh
text-replacer-with-file TARGET_FILE REPLACED_TEXT INSERTED_FILE
```

## Examples

Create `a.txt`, `b.txt` and `c.txt` as;

```text:a.txt
This is a text file for tests. abc will be replaced.
Duplicated bcd will be replaced.
This bcd will be also replaced.
c/d/e dosen't exist.
```

```text:b.txt
"This text was in b.txt"
```

```text:c.txt
"Multi lines in c.txt
are inserted!"
```

### Example 1

```bash
text-replacer-with-file a.txt abc b.txt
```

`a.txt` will be;

```text:a.txt
This is a text file for tests. "This text was in b.txt" will be replaced.
Duplicated bcd will be replaced.
This bcd will be also replaced.
c/d/e dosen't exist.
```

### Example 2

```bash
text-replacer-with-file a.txt abc c.txt
```

`a.txt` will be;

```text:a.txt
This is a text file for tests. "Multi lines in c.txt
are inserted!" will be replaced.
Duplicated bcd will be replaced.
This bcd will be also replaced.
c/d/e dosen't exist.
```

### Example 3

```bash
text-replacer-with-file a.txt bcd b.txt
```

`a.txt` will be;

```text:a.txt
This is a text file for tests. abc will be replaced.
Duplicated "This text was in b.txt" will be replaced.
This "This text was in b.txt" will be also replaced.
c/d/e dosen't exist.
```

### Example 4

```bash
text-replacer-with-file a.txt cde b.txt
```

`a.txt` will not change because `cde` doesn't exist in `a.txt`.

#### Memo

Should this behavior return not 0? Behave as an error?

## Test

`./test/run.sh`

### About shUnit2

[shUnit2](http://code.google.com/p/shunit2/) is a xUnit for ShellScript.

Download it from [here](http://code.google.com/p/shunit2/) (I've downloaded `shunit2-2.1.6.tgz`) and extract it. Then, copy `src/shunit2` into `test` directory.

An official documentation is [here](http://shunit2.googlecode.com/svn/trunk/source/2.1/doc/shunit2.html). Refer it to know how to use shUnit2 more.
