#
# To run a single test, use like this:
#
#    make test RUN=org-journal-carryover-items-test
#

EMACS=emacs
export LC_ALL=C

all: clean compile test

test: compile
	${EMACS} -Q -batch -L . -l tests/org-journal-test --eval="(ert-run-tests-batch-and-exit $(RUN:%='%) )"

compile:
	${EMACS} -Q -batch -L . -f batch-byte-compile tests/org-journal-test.el org-journal.el

clean:
	rm -f *.elc
