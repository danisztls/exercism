import std/strformat

proc twoFer*(name: string = ""): string =
  if name != "": 
    result = fmt"One for {name}, one for me."

  else:
    result = "One for you, one for me."