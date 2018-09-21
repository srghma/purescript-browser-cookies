module Main where

import Data.Foldable
import Prelude

import Browser.Cookie (getCookie, getCookies, setCookie, setCookie2)
import Browser.Cookies.Data (SetCookie(..), Cookie(..), CookieOpts(..), encode)
import Data.Traversable (traverse)
import Effect (Effect)
import Effect.Console (log)
import Data.Maybe (Maybe(..))

main :: Effect Unit
main = do
  -- log $ foldMap identity 
  c <- getCookie "test_cookie"
  -- log $ encode c
  setCookie2 "test_cookie=123123123"
  cookies <- getCookies
  foldMap log cookies
    -- where


-- cook :: SetCookie
-- cook = SetCookie { cookie: Cookie { key: "key", value: "value" }, opts: Nothing }
cook :: Maybe Cookie -> SetCookie
cook (Just (Cookie { key, value })) = SetCookie { cookie: Cookie { key: key <> "a", value: value <> "b" }, opts: Nothing }
cook Nothing = SetCookie { cookie: Cookie { key: "", value: "" }, opts: Nothing }