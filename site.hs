{-# LANGUAGE OverloadedStrings #-} -- Needed for the matching
import Hakyll
import Data.Monoid (mappend)

main :: IO ()
main = hakyllWith myConfig $ do

  --- find and compress CSS
  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "static/**" $ do
    route idRoute
    compile copyFileCompiler

  match "posts/*" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/post.html" postCtx
      >>= saveSnapshot "content"
      >>= loadAndApplyTemplate "templates/base.html" postCtx
      >>= relativizeUrls

  -- change into a generic for each page not under static
  match "posts.html" $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "posts/*"
      let indexCtx = listField "posts" postCtx (return posts) `mappend`
                      constField "title" "home" `mappend`
                      defaultContext
      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/base.html" postCtx
        >>= relativizeUrls

  match "index.html" $ do
    route idRoute
    compile $ do
      posts <- fmap (take 5) . recentFirst =<< loadAll "posts/*"
      let indexCtx = listField "posts" postCtx (return posts) `mappend`
                      constField "title" "home" `mappend`
                      defaultContext
      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/base.html" postCtx
        >>= relativizeUrls

  match "contact.html" $ do
    route idRoute
    compile $ do
      getResourceBody
        >>= loadAndApplyTemplate "templates/base.html" postCtx
        >>= relativizeUrls

  create ["rss.xml"] $ do
    route idRoute
    compile $ do
      let feedCtx = postCtx `mappend` bodyField "description"
      posts <- fmap (take 10) . recentFirst =<<
        loadAllSnapshots "posts/*" "content"
      renderRss myFeedConfiguration feedCtx posts

  match "templates/*" $ compile templateCompiler

--  match "404.html" $ do
--    route idRoute
--    compile $ pandocCompiler
--      >>= loadAndApplyTemplate "templates/base.html" defaultContext
--      >>= relativizeUrls


myConfig :: Configuration
myConfig = defaultConfiguration
  { deployCommand = "rsync -avezc 'ssh' \
  \_site/* bbrittain_benbrittain@ssh.phx.nearlyfreespeech.net:/home/public"
  }

-- RSS stuff taken right from the tutorial
myFeedConfiguration :: FeedConfiguration
myFeedConfiguration = FeedConfiguration
    { feedTitle       = "Ben Brittain"
    , feedDescription = "Agitated with the present"
    , feedAuthorName  = "Ben Brittain"
    , feedAuthorEmail = "ben@benbrittain.com"
    , feedRoot        = "http://benbrittain.com"
    }


--- change to support 5 digit years
postCtx :: Context String
postCtx =
    dateField "date" "%Y-%m-%d" `mappend`
    defaultContext
