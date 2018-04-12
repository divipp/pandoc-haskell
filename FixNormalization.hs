#!/usr/bin/env runghc
import Text.Pandoc
import Text.Pandoc.JSON

main :: IO ()
main = toJSONFilter haskellCode'

haskellCode :: Inline -> Inline
haskellCode (Code (i, cs, kv) c) = Code (i, f cs, kv) c
  where
    f [] = ["haskell"]
    f cs = cs
haskellCode x = x

haskellCode' :: Block -> Block
haskellCode' (CodeBlock (i, cs, kv) c) = CodeBlock (i, f cs, kv) c
  where
    f ["haskell"] = []
    f cs = cs
haskellCode' x = x


