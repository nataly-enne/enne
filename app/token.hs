module Token where

import Lexer
import Text.Parsec
import Data.Functor.Identity

-- general statements programing
-- update_pos :: SourcePos -> Token -> [Token] -> SourcePos
update_pos pos _ (tok:_) = pos -- needs improvement
update_pos pos _ []      = pos

idToken :: ParsecT [Token] st IO Token
idToken = tokenPrim show update_pos get_token where
    get_token (Id x) = Just (Id x)
    get_token _      = Nothing

ifToken :: ParsecT [Token] st IO Token
ifToken = tokenPrim show update_pos get_token where
    get_token If = Just If
    get_token _  = Nothing

elseToken :: ParsecT [Token] st IO Token
elseToken = tokenPrim show update_pos get_token where
    get_token Else = Just Else
    get_token _    = Nothing

whileToken :: ParsecT [Token] st IO Token
whileToken = tokenPrim show update_pos get_token where
    get_token While = Just While
    get_token _    = Nothing

funcToken :: ParsecT [Token] st IO Token
funcToken = tokenPrim show update_pos get_token where
    get_token Func = Just Func
    get_token _    = Nothing

-- beginToken :: ParsecT [Token] st IO Token
-- beginToken x = tokenPrim show update_pos get_token where
--     get_token (Block b) = if x == b then Just (Block )
--     get_token _        = Nothing

leftParentesisToken :: ParsecT [Token] st IO Token
leftParentesisToken = tokenPrim show update_pos get_token where
    get_token (Parenthesis "(") = Just (Parenthesis "(")
    get_token _                 = Nothing

rightParentesisToken :: ParsecT [Token] st IO Token
rightParentesisToken = tokenPrim show update_pos get_token where
    get_token (Parenthesis ")") = Just (Parenthesis ")")
    get_token _                 = Nothing

leftBlockToken :: ParsecT [Token] st IO Token
leftBlockToken = tokenPrim show update_pos get_token where
    get_token (Block "{") = Just (Block "{")
    get_token _           = Nothing

rightBlockToken :: ParsecT [Token] st IO Token
rightBlockToken = tokenPrim show update_pos get_token where
    get_token (Block "}") = Just (Block "}")
    get_token _           = Nothing

-- language types
-- floatToken :: ParsecT [Token] st Data.Functor.Identity.Identity Token
floatToken :: ParsecT [Token] st IO (Token)
floatToken = tokenPrim show update_pos get_token where
    get_token (Float x) = Just (Float x)
    get_token _         = Nothing

intToken :: ParsecT [Token] st IO (Token)
intToken = tokenPrim show update_pos get_token where
    get_token (Int x) = Just (Int x)
    get_token _       = Nothing

booleanToken :: ParsecT [Token] u IO Token
booleanToken = tokenPrim show update_pos get_token where
    get_token (Boolean x) = Just (Boolean x)
    get_token _           = Nothing

addToken :: ParsecT [Token] u IO Token
addToken = tokenPrim show update_pos get_token where
    get_token (Add) = Just (Add)
    get_token _      = Nothing

subToken :: ParsecT [Token] u IO Token
subToken = tokenPrim show update_pos get_token where
    get_token (Sub) = Just (Sub)
    get_token _      = Nothing

multToken :: ParsecT [Token] u IO Token
multToken = tokenPrim show update_pos get_token where
    get_token (Mult) = Just (Mult)
    get_token _      = Nothing

stringToken :: ParsecT [Token] u IO Token
stringToken = tokenPrim show update_pos get_token where
    get_token (String x) = Just (String x)
    get_token _        = Nothing

typeToken :: ParsecT [Token] u IO Token
typeToken = tokenPrim show update_pos get_token where
    get_token (Type x) = Just (Type x)
    get_token _        = Nothing

semiColonToken :: ParsecT [Token] u IO Token
semiColonToken = tokenPrim show update_pos get_token where
    get_token (SemiColon) = Just (SemiColon)
    get_token _        = Nothing

colonToken :: ParsecT [Token] u IO Token
colonToken = tokenPrim show update_pos get_token where
    get_token (Colon) = Just (Colon)
    get_token _        = Nothing

commaToken :: ParsecT [Token] u IO Token
commaToken = tokenPrim show update_pos get_token where
    get_token (Comma) = Just (Comma)
    get_token _        = Nothing

assignToken :: ParsecT [Token] u IO Token
assignToken = tokenPrim show update_pos get_token where
    get_token (Assign) = Just (Assign)
    get_token _        = Nothing

greaterToken :: ParsecT [Token] u IO Token
greaterToken = tokenPrim show update_pos get_token where
    get_token (Greater) = Just (Greater)
    get_token _         = Nothing

greaterOrEqualToken :: ParsecT [Token] u IO Token
greaterOrEqualToken = tokenPrim show update_pos get_token where
    get_token (GreaterOrEqual) = Just (GreaterOrEqual)
    get_token _                = Nothing

lowerToken :: ParsecT [Token] u IO Token
lowerToken = tokenPrim show update_pos get_token where
    get_token (Lower) = Just (Lower)
    get_token _        = Nothing

lowerOrEqualToken :: ParsecT [Token] u IO Token
lowerOrEqualToken = tokenPrim show update_pos get_token where
    get_token (LowerOrEqual) = Just (LowerOrEqual)
    get_token _              = Nothing

equalToToken :: ParsecT [Token] u IO Token
equalToToken = tokenPrim show update_pos get_token where
    get_token (EqualTo) = Just (EqualTo)
    get_token _         = Nothing

notEqualToToken :: ParsecT [Token] u IO Token
notEqualToToken = tokenPrim show update_pos get_token where
    get_token (NotEqualTo) = Just (NotEqualTo)
    get_token _            = Nothing

logicalOpToken :: ParsecT [Token] u IO Token
logicalOpToken = tokenPrim show update_pos get_token where
    get_token (LogicalOp s) = Just (LogicalOp s)
    get_token _             = Nothing