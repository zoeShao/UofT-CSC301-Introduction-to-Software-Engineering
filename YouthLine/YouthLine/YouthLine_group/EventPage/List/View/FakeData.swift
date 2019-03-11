//
//  FakeData.swift
//  YouthLine
//
//  Created by Yecheng Song on 2019-03-10.
//  Copyright © 2019 RainbowWarrior. All rights reserved.
//

import Foundation

var count = 0

var imageUrl = ["https://pic4.zhimg.com/v2-57025d3b940f9039d056632b1281ba77_400x224.jpeg",
                "https://pic3.zhimg.com/v2-f17afefb491af262dfef5a7a0fedf4a4_b.jpg",
                "https://pic2.zhimg.com/v2-4c9f1733c129d25694af8543318c0b71_b.jpg",
                "https://pic2.zhimg.com/v2-e21b74f5db9e213b852039560c703b7a_b.jpg",
                "https://pic1.zhimg.com/v2-761fbe5070386c56a3c0c49680e603f3_b.jpg"]

var mappedObject = [Optional(YouthLine.Model(common_card: Optional(YouthLine.CommonCard(style: Optional("BIG_IMAGE"), footline: Optional(YouthLine.FootLine(elements: Optional([YouthLine.RecomElement(text: Optional(YouthLine.RecomText(color: Optional("GBK06A"), size: 14, max_line: 1, panel_text: Optional(""), weight: Optional("NORMAL"))))]))), ellipsis_menu: Optional(YouthLine.Ellipsis_menu()), feed_content: Optional(YouthLine.Feed_content(video: Optional(YouthLine.RecomVideo(id: Optional("1083058811471966208"), duration_in_seconds: 229, thumbnail: Optional(YouthLine.RecomThumbnail(image_url: Optional(""))), playlist: Optional(YouthLine.RecomPlayList(ld: Optional(YouthLine.Recomld(url: Optional(""))))))), image: nil, title: Optional(YouthLine.Recom_title(panel_text: Optional("Test data"), action: nil)), content: Optional(YouthLine.RecomContent(panel_text: Optional("This is xcode project YouthLine"))))))), fields: nil, uninterest_reasons: Optional([YouthLine.RecomUninterestReason(object_token: Optional("19550429"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("20203075"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("513bc3fb5dae7bdbaf4087dde44420a8"), reason_type: Optional("creator"))]), extra: Optional(YouthLine.RecomExtra(id: Optional("57552115"))))), Optional(YouthLine.Model(common_card: Optional(YouthLine.CommonCard(style: Optional("SMALL_IMAGE"), footline: Optional(YouthLine.FootLine(elements: Optional([YouthLine.RecomElement(text: Optional(YouthLine.RecomText(color: Optional("GBK06A"), size: 14, max_line: 1, panel_text: Optional(""), weight: Optional("NORMAL"))))]))), ellipsis_menu: Optional(YouthLine.Ellipsis_menu()), feed_content: Optional(YouthLine.Feed_content(video: nil, image: Optional(YouthLine.RecomImage(image_url: Optional(""))), title: Optional(YouthLine.Recom_title(panel_text: Optional("New event title goes here"), action: Optional(YouthLine.RecomAction(intent_url: Optional(""))))), content: Optional(YouthLine.RecomContent(panel_text: Optional("Rainbow Warrior is awesome"))))))), fields: nil, uninterest_reasons: Optional([YouthLine.RecomUninterestReason(object_token: Optional("19942421"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19560551"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19604735"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("20033168"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("0720e660beeaf09c547c6349dcdcf7da"), reason_type: Optional("creator"))]), extra: Optional(YouthLine.RecomExtra(id: Optional("596622964"))))), Optional(YouthLine.Model(common_card: Optional(YouthLine.CommonCard(style: Optional("SMALL_IMAGE"), footline: Optional(YouthLine.FootLine(elements: Optional([YouthLine.RecomElement(text: Optional(YouthLine.RecomText(color: Optional("GBK06A"), size: 14, max_line: 1, panel_text: Optional(""), weight: Optional("NORMAL"))))]))), ellipsis_menu: Optional(YouthLine.Ellipsis_menu()), feed_content: Optional(YouthLine.Feed_content(video: nil, image: Optional(YouthLine.RecomImage(image_url: Optional(""))), title: Optional(YouthLine.Recom_title(panel_text: Optional("Good to see you !"), action: Optional(YouthLine.RecomAction(intent_url: Optional(""))))), content: Optional(YouthLine.RecomContent(panel_text: Optional("This is a test mode, just relax"))))))), fields: nil, uninterest_reasons: Optional([YouthLine.RecomUninterestReason(object_token: Optional("19582090"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19645158"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19551147"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("5b130cd2f1520e1690c7d0d00fe73841"), reason_type: Optional("creator"))]), extra: Optional(YouthLine.RecomExtra(id: Optional("567619834"))))), Optional(YouthLine.Model(common_card: nil, fields: nil, uninterest_reasons: nil, extra: nil)), Optional(YouthLine.Model(common_card: Optional(YouthLine.CommonCard(style: Optional("SMALL_IMAGE"), footline: Optional(YouthLine.FootLine(elements: Optional([YouthLine.RecomElement(text: Optional(YouthLine.RecomText(color: Optional("GBK06A"), size: 14, max_line: 1, panel_text: Optional(""), weight: Optional("NORMAL"))))]))), ellipsis_menu: Optional(YouthLine.Ellipsis_menu()), feed_content: Optional(YouthLine.Feed_content(video: nil, image: Optional(YouthLine.RecomImage(image_url: Optional("https://"))), title: Optional(YouthLine.Recom_title(panel_text: Optional("Here"), action: nil)), content: Optional(YouthLine.RecomContent(panel_text: Optional("testing..."))))))), fields: nil, uninterest_reasons: Optional([YouthLine.RecomUninterestReason(object_token: Optional("19644544"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19857450"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19737530"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("2e46bd3045a043f58c6f9180c5645d49"), reason_type: Optional("creator"))]), extra: Optional(YouthLine.RecomExtra(id: Optional("56050482"))))), Optional(YouthLine.Model(common_card: Optional(YouthLine.CommonCard(style: Optional("SMALL_IMAGE"), footline: Optional(YouthLine.FootLine(elements: Optional([YouthLine.RecomElement(text: Optional(YouthLine.RecomText(color: Optional("GBK06A"), size: 14, max_line: 1, panel_text: Optional(""), weight: Optional("NORMAL"))))]))), ellipsis_menu: Optional(YouthLine.Ellipsis_menu()), feed_content: Optional(YouthLine.Feed_content(video: nil, image: Optional(YouthLine.RecomImage(image_url: Optional(""))), title: Optional(YouthLine.Recom_title(panel_text: Optional("Nice to meet you !"), action: Optional(YouthLine.RecomAction(intent_url: Optional(""))))), content: Optional(YouthLine.RecomContent(panel_text: Optional("Zoe: My name is Zoe"))))))), fields: nil, uninterest_reasons: Optional([YouthLine.RecomUninterestReason(object_token: Optional("19568143"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19629841"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19551432"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19729809"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19596206"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("bdf1f37e2933f635474f0a4dff187261"), reason_type: Optional("creator"))]), extra: Optional(YouthLine.RecomExtra(id: Optional("549713959"))))), Optional(YouthLine.Model(common_card: Optional(YouthLine.CommonCard(style: Optional("SMALL_IMAGE"), footline: Optional(YouthLine.FootLine(elements: Optional([YouthLine.RecomElement(text: Optional(YouthLine.RecomText(color: Optional("GBK06A"), size: 14, max_line: 1, panel_text: Optional(""), weight: Optional("NORMAL"))))]))), ellipsis_menu: Optional(YouthLine.Ellipsis_menu()), feed_content: Optional(YouthLine.Feed_content(video: nil, image: nil, title: Optional(YouthLine.Recom_title(panel_text: Optional("25th Anniversary & Youth Awards Gala"), action: Optional(YouthLine.RecomAction(intent_url: Optional(""))))), content: Optional(YouthLine.RecomContent(panel_text: Optional("Our Youth Awards Gala celebrates and affirms the contributions of 2SLGBTQ youth leaders across Ontario!"))))))), fields: nil, uninterest_reasons: Optional([YouthLine.RecomUninterestReason(object_token: Optional("19550447"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19552192"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19551147"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("19550429"), reason_type: Optional("topic")), YouthLine.RecomUninterestReason(object_token: Optional("6e5d9c6ddc61e60c34894700a4989a14"), reason_type: Optional("creator"))]), extra: Optional(YouthLine.RecomExtra(id: Optional("574752267")))))]3")))))] 
