# for convenience , treat each field as a word
{ nc = nc + length($0) +1
  nw = nw +NF
}

END { print NR, "line," nw, "words,",nc, "characters"}
