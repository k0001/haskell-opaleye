{-# LANGUAGE FlexibleContexts #-}

module Opaleye.Values where

import qualified Opaleye.QueryArr as Q
import           Opaleye.QueryArr (Query)
import           Opaleye.Internal.Values as V
import qualified Opaleye.Internal.Unpackspec as U

import           Data.Profunctor.Product.Default (Default, def)

values :: (Default V.Valuesspec columns columns,
           Default U.Unpackspec columns columns) =>
          [columns] -> Q.Query columns
values = valuesExplicit def def

valuesExplicit :: U.Unpackspec columns columns'
               -> V.Valuesspec columns columns'
               -> [columns] -> Query columns'
valuesExplicit unpack valuesspec columns =
  Q.simpleQueryArr (V.valuesU unpack valuesspec columns)
