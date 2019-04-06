all:
	@dune build @install

clean:
	@dune clean

test:
	@dune runtest
