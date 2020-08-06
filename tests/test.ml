(* This will test the output of the stemmer.c implementation against
   the stemmer.ml implementation.

   $Id: test.ml,v 1.2 2003/07/20 18:50:21 erik Exp $
*)

let _ =
  let rec aux failed chan =
    try
      let word = String.lowercase_ascii (input_line chan) in
      if not (Stemmer.stem word = StemmerC.stem word) then (
        print_string
          ( word ^ " did not match (" ^ Stemmer.stem word ^ " != "
          ^ StemmerC.stem word ^ ")\n" ) ;
        aux (succ failed) chan )
      else aux failed chan
    with _ ->
      print_int failed ;
      print_string " tests failed\n"
  in
  let chan = open_in "/usr/share/dict/words" in
  aux 0 chan
