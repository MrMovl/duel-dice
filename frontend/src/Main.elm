module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (class, src, id)


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
    , playerDice : Hand
    }


type alias Dice =
    List DiceFace


type alias Hand =
    { head : Dice
    , leftArm : Dice
    , rightArm : Dice
    , body : Dice
    , leftLeg : Dice
    , rightLeg : Dice
    }


defaultDice : Hand
defaultDice =
    { head = [ Blank, Blank, Blank, Blank, Blank, Blank ]
    , leftArm = [ Blank, Blank, Blank, Blank, Blank, Blank ]
    , rightArm = [ Blank, Blank, Blank, Blank, Blank, Blank ]
    , body = [ Blank, Blank, Blank, Blank, Blank, Blank ]
    , leftLeg = [ Blank, Blank, Blank, Blank, Blank, Blank ]
    , rightLeg = [ Blank, Blank, Blank, Blank, Blank, Blank ]
    }


init : ( Model, Cmd Msg )
init =
    ( { currentTurn = Player
      , playerHealth = 20
      , oponentHealth = 20
      , playerDice = defaultDice
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
        , div [ class "playerArea characterArea" ] [ (handView model) ]
        ]


handView : Model -> Html Msg
handView model =
    let
        hand =
            model.playerDice
    in
        div [ class "diceContainer" ]
            [ div [ id "head" ] [ diceView hand.head ]
            , div [ id "leftArm" ] [ diceView hand.leftArm ]
            , div [ id "rightArm" ] [ diceView hand.rightArm ]
            , div [ id "leftArm" ] [ diceView hand.leftArm ]
            , div [ id "leftArm" ] [ diceView hand.leftArm ]
            , div [ id "leftArm" ] [ diceView hand.leftArm ]
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
