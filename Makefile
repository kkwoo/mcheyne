OBJS = file01 file02 file03 file04 file05

file05: file04
        awk -F'\t' '{printf "{\"id\": \"%s\", \"secret01\": \"%s\", \"secret02\": \"%s\", \"family01\": \"%s\", \"family02\": \"%s\"}\n", NR, $$3, $$4, $$5, $$6;}' < file04 > file05

file04: file03
        sed -E 's/(\|)|:|(  +)/\t/g' file03 > file04

file03: file02
        awk -F'(Family|Secret):' '{print $$1, $$2, $$3;}' < file02 > file03

file02: file01
        grep Family: file01 > file02

file01:
        w3m -dump -cols 132 https://bibleplan.org/plans/mcheyne/ > file01

clean:
        rm ${OBJS}
