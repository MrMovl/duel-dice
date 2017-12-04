module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (class, src)


---- MODEL ----


type DiceImage
    = Blank
    | SingleAttack
    | SingleDefense
    | SingleSkillpoint


type Turn
    = Player
    | Oponent


type alias Model =
    { currentTurn : Turn
    , playerHealth : Int
    , oponentHealth : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { currentTurn = Player, playerHealth = 20, oponentHealth = 20 }, Cmd.none )



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
        , div [ class "playerArea" ] [ diceView Blank ]
        ]


getDiceImageSrc : DiceImage -> String
getDiceImageSrc image =
    case image of
        Blank ->
            "blank.png"

        SingleAttack ->
            "singleAttack.png"

        SingleDefense ->
            "singleDefense.png"

        SingleSkillpoint ->
            "singleSkillpoint.png"


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
