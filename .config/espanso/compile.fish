#!/bin/fish

set HEADER_TEXT "### GENERATED BY JSONNET USING compile.fish. DO NOT EDIT!\n"

set ROOT_DIR (realpath (status dirname))
set SRC_DIR "$ROOT_DIR/src/"
set ESC_SRC_DIR (string escape $SRC_DIR)
set SRC_FILES (ls $SRC_DIR/**/**.jsonnet)
set OUTPUT_DIR "/mnt/c/Users/jeppe/AppData/Roaming/espanso/"
set OUTPUT_USER_DIR $OUTPUT_DIR"user/"

echo "Putting files in output directory $OUTPUT_DIR"

echo "Copying over default.yml"
echo -e $HEADER_TEXT > $OUTPUT_DIR"default.yml"
cat $SRC_DIR"default.yml" >> $OUTPUT_DIR"default.yml"

for f in $SRC_FILES
    set fn (string split -r -m1 . $f)[1]
    set f_esc (echo $fn | sed 's,^'$SRC_DIR",," | string replace -a / _)

    set fn_yml "$f_esc.yml"
    set f_out "$OUTPUT_USER_DIR""$fn_yml"

    echo -e $HEADER_TEXT > $f_out
    jsonnet -S $f >> $f_out

    echo "Generated $f_out"
end

echo "Processed "(math (count $SRC_FILES) + 1)" files."
