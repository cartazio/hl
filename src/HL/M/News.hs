{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- | Get Haskell news.

module HL.M.News where

import HL.C

import Data.Text.Lazy.Encoding
import Data.Text.Lazy (toStrict)
import Network.HTTP.Conduit
import Prelude hiding (readFile)

getHaskellNews :: IO Html
getHaskellNews =
  do bytes <- simpleHttp "http://haskellnews.org/grouped?embeddable"
     return (preEscapedToMarkup (toStrict (decodeUtf8 bytes)))
