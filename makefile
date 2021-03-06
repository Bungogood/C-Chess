IDIR = include
ODIR = .obj
SDIR = src

LIBS = 

CC = gcc
CFLAGS = -I $(IDIR)

_DEPS = 
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = chess.o bitboard.o board.o moveGenerator.o test.o solver.o main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

chess: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

magic: 
	gcc -o magic src/magic.c -I include

online: 
	gcc -o online src/online.c

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(IDIR)/*~ 
