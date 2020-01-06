OBJS = file01 file02 file03

file03: file02
        awk -F'(Family|Secret):' '{print $$1, $$2, $$3;}' < file02 > file03

file02: file01
        grep Family: file01 > file02

file01:
        w3m -dump -cols 132 https://bibleplan.org/plans/mcheyne/ > file01

clean:
        rm ${OBJS}
