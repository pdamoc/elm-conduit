module Types exposing (..)

import Navigation exposing (Location)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (decode, required)
import Json.Encode as JE
import Utils
import RemoteData exposing (WebData)


{-| SiteMap
-}
type Page
    = Home
    | Login
    | Register
    | Editor
    | Settings
    | Error Location


{-| The Main Model
-}
type alias Model =
    { currentPage : Page
    , store : Store
    }


type alias Store =
    { user : Maybe User
    , tags : WebData (List String)
    }


type alias User =
    { email : String
    , token : String
    , username : String
    , bio : String
    , image : Maybe String
    }


userDecoder : Decoder User
userDecoder =
    decode User
        |> required "email" string
        |> required "token" string
        |> required "username" string
        |> required "bio" string
        |> required "image" (maybe string)


parseUser : Value -> Maybe User
parseUser value =
    decodeValue userDecoder value
        |> Result.toMaybe


userEncoder : User -> Value
userEncoder user =
    JE.object
        [ ( "email", JE.string user.email )
        , ( "token", JE.string user.token )
        , ( "username", JE.string user.username )
        , ( "bio", JE.string user.bio )
        , ( "image", Utils.maybe JE.string user.image )
        ]


type alias Profile =
    { username : String
    , bio : String
    , image : String
    , following : Bool
    }


type alias Article =
    { slug : String
    , title : String
    , description : String
    , body : String
    , createdAt : String
    , updatedAt : String
    , favorited : Bool
    , favoritesCount : Int
    , author : Profile
    , tagList : List String
    }



--- Samples


profileSample : Profile
profileSample =
    { username = "Rick"
    , bio = "Wubba-lubba-dub-dub!"
    , image = "https://avatarfiles.alphacoders.com/597/thumb-59796.png"
    , following = False
    }


profileSample2 : Profile
profileSample2 =
    { username = "Morty"
    , bio = "I love Jessica "
    , image = "http://i.imgur.com/FA9XNo1.jpg"
    , following = False
    }


articleSample : Article
articleSample =
    { slug = "mr-meeseeks"
    , title = "How to have fun with Mr. Meeseeks"
    , description = "Ever wonder how?"
    , body = "We Meeseeks are not born into this world fumbling for meaning, Jerry! We are created to serve a singular purpose for which we will go to any lengths to fufill! Existence is pain to a Meeseeks, Jerry! And we will do anything to alleviate that pain!"
    , createdAt = "2016-02-18T03:22:56.637Z"
    , updatedAt = "2016-02-18T03:48:35.824Z"
    , favorited = False
    , favoritesCount = 69
    , author = profileSample
    , tagList = [ "meeseeks", "fun" ]
    }


articleSample2 : Article
articleSample2 =
    { slug = "get-your-shit-together"
    , title = "Get your shit together"
    , description = "Get it all together and put it in a backpack"
    , body = "Well then get your shit together. Get it all together and put it in a backpack, all your shit, so it's together. ...and if you gotta take it somewhere, take it somewhere ya know? Take it to the shit store and sell it, or put it in a shit museum. I don't care what you do, you just gotta get it together... Get your shit together."
    , createdAt = "2016-02-18T03:22:56.637Z"
    , updatedAt = "2016-02-18T03:48:35.824Z"
    , favorited = False
    , favoritesCount = 69
    , author = profileSample2
    , tagList = [ "together", "family" ]
    }
