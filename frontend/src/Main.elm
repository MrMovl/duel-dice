module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (class, src)


---- MODEL ----


type DiceFace
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
    , playerDice : List Dice
    }


type alias Dice =
    List DiceFace


defaultDice : Dice
defaultDice =
    [ Blank, Blank, Blank, Blank, Blank, Blank ]


init : ( Model, Cmd Msg )
init =
    ( { currentTurn = Player
      , playerHealth = 20
      , oponentHealth = 20
      , playerDice = List.repeat 6 defaultDice
      }
    , Cmd.none
    )



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
        [ div [ class "oponentArea characterArea" ] []
        , div [ class "playerArea characterArea" ] (diceListView model)
        ]


getDiceImageSrc : DiceFace -> String
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


diceListView : Model -> List (Html Msg)
diceListView model =
    List.map diceView model.playerDice


diceView : Dice -> Html Msg
diceView dices =
    let
        imgSrc =
            dices |> List.head |> Maybe.withDefault Blank |> getDiceImageSrc |> (++) "/diceImage-"
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
