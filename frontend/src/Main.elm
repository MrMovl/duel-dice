module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (class, src)


---- MODEL ----


type DiceImage
    = Default


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "gameArea" ]
        [ div [ class "oponentArea" ] []
        , div [ class "playerArea" ] [ diceView Default ]
        ]


getDiceImageSrc : DiceImage -> String
getDiceImageSrc image =
    case image of
        Default ->
            "default.png"


diceView : DiceImage -> Html Msg
diceView image =
    let
        imgSrc =
            image |> getDiceImageSrc |> (++) "/diceImage-"
    in
        img [ class "diceImage", src imgSrc ] []



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
