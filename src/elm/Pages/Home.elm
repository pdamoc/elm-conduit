module Pages.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)
import Store
import RemoteData exposing (..)


view : Model -> Html msg
view model =
    div []
        [ navBar model
        , homePage model.store
        , footer_
        ]


articlePreview : Article -> Html msg
articlePreview article =
    box "article-preview"
        [ box "article-meta"
            [ a [ href (toUrl Home) ]
                [ img [ src article.author.image ]
                    []
                ]
            , box "info"
                [ a [ class "author", href "" ]
                    [ text article.author.username ]
                , span [ class "date" ]
                    [ text (String.left 10 article.updatedAt) ]
                ]
            , button [ class "btn btn-outline-primary btn-sm pull-xs-right" ]
                [ i [ class "ion-heart" ]
                    []
                , span [ class "pl-1" ] [ text <| toString article.favoritesCount ]
                ]
            ]
        , a [ class "preview-link", href "" ]
            [ h1 []
                [ text article.title ]
            , p []
                [ text article.description ]
            , span []
                [ text "Read more..." ]
            , ul
                [ class "tag-list" ]
                (List.map outlineTag article.tagList)
            ]
        ]


homePage : Store -> Html msg
homePage store =
    box "home-page"
        [ box "banner"
            [ box "container"
                [ h1 [ class "logo-font" ]
                    [ text "conduit" ]
                , p []
                    [ text "A place to share your knowledge." ]
                ]
            ]
        , box "container page"
            [ row
                [ box "col-md-9"
                    [ box "feed-toggle"
                        [ ul [ class "nav nav-pills outline-active" ]
                            [ li [ class "nav-item" ]
                                [ a [ class "nav-link disabled", href "" ]
                                    [ text "Your Feed" ]
                                ]
                            , li [ class "nav-item" ]
                                [ a [ class "nav-link active", href "" ]
                                    [ text "Global Feed" ]
                                ]
                            ]
                        ]
                    , articlePreview articleSample
                    , articlePreview articleSample2
                    ]
                , box "col-md-3"
                    [ box "sidebar"
                        [ p []
                            [ text "Popular Tags" ]
                        , tagList store.tags
                        ]
                    ]
                ]
            ]
        ]
