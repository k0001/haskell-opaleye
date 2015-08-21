-- Copyright   :  Daan Leijen (c) 1999, daan@cs.uu.nl
--                HWT Group (c) 2003, haskelldb-users@lists.sourceforge.net
-- License     :  BSD-style

module Opaleye.Internal.HaskellDB.Sql.Generate (SqlGenerator(..)) where

import Opaleye.Internal.HaskellDB.PrimQuery
import Opaleye.Internal.HaskellDB.Sql

import qualified Data.List.NonEmpty as NEL

data SqlGenerator = SqlGenerator
    {
     sqlUpdate      :: SchemaName -> TableName -> [PrimExpr] -> Assoc -> SqlUpdate,
     sqlDelete      :: SchemaName -> TableName -> [PrimExpr] -> SqlDelete,
     sqlInsert      :: SchemaName -> TableName -> [Attribute] -> NEL.NonEmpty [PrimExpr] -> SqlInsert,
     sqlExpr        :: PrimExpr -> SqlExpr,
     sqlLiteral     :: Literal -> String,
     -- | Turn a string into a quoted string. Quote characters
     -- and any escaping are handled by this function.
     sqlQuote       :: String -> String
    }
