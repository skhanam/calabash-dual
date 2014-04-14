#!/bin/env ruby
# encoding: utf-8

#BOOKINGS={"payload" => {
#    "userName" => {"firstName" => "Peter", "lastName" => "Pan"},
#    "reservationLists" =>
#        {"CURRENT" => [{"startDate" => "2013-07-03", "destination" => "TUI Deutschland", "mainProductType" => "Versicherung", "allProductTypes" => ["Versicherung"], "id" => "38072949"}, {"startDate" => "2014-09-06", "destination" => "Palma de Mallorca", "mainProductType" => "Flug", "allProductTypes" => ["Flug"], "id" => "75511407"}, {"startDate" => "2014-09-08", "destination" => "Kanaren/Fuerteventura, Costa Calma", "mainProductType" => "Mietwagen", "allProductTypes" => ["Mietwagen"], "id" => "36739063"}, {"startDate" => "2014-09-10", "destination" => "Mallorca, Palma de Mallorca", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Unterkunft", "Flug"], "id" => "80522690"}, {"startDate" => "2014-09-10", "destination" => "Costa de la Luz, Novo Sancti Petri", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Extra", "Unterkunft", "Flug", "Extra"], "id" => "80522687"}, {"startDate" => "2014-09-10", "destination" => "Mallorca, Can Picafort", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Unterkunft", "Flug"], "id" => "80522689"}, {"startDate" => "2014-09-10", "destination" => "Balearen/Mallorca, Can Pastilla-Palma de Mallorca", "mainProductType" => "Mietwagen", "allProductTypes" => ["Mietwagen"], "id" => "36739099"}, {"startDate" => "2014-09-10", "destination" => "Türkische Riviera, Alanya", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Unterkunft", "Flug"], "id" => "80522694"}, {"startDate" => "2014-09-10", "destination" => "Türkische Riviera, Belek", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Unterkunft", "Unterkunft", "Flug"], "id" => "80522699"}, {"startDate" => "2014-09-10", "destination" => "Palma de Mallorca", "mainProductType" => "Flug", "allProductTypes" => ["Flug", "Flug"], "id" => "80522702"}, {"startDate" => "2014-09-11", "destination" => "Jerez de la Frontera", "mainProductType" => "Flug", "allProductTypes" => ["Flug", "Flug"], "id" => "80522707"}, {"startDate" => "2014-09-11", "destination" => "Costa de la Luz, Novo Sancti Petri", "mainProductType" => "Unterkunft", "allProductTypes" => ["Rundreise", "Unterkunft"], "id" => "80522708"}, {"startDate" => "2014-09-15", "destination" => "Thailand", "mainProductType" => "Transfer", "allProductTypes" => ["Transfer"], "id" => "80522737"}],
#         "PAST" => [{"startDate" => "2013-12-09", "destination" => "Teneriffa, Costa Adeje", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75458864"}, {"startDate" => "2013-11-12", "destination" => "Kanaren/Fuerteventura, Costa Calma", "mainProductType" => "Mietwagen", "allProductTypes" => ["Mietwagen"], "id" => "36736642"}, {"startDate" => "2013-11-03", "destination" => "Mallorca", "mainProductType" => "Extra", "allProductTypes" => ["Extra"], "id" => "75405541"}, {"startDate" => "2013-10-14", "destination" => "Nevada, Las Vegas", "mainProductType" => "Camper", "allProductTypes" => ["Extra", "Camper", "Extra", "Extra"], "id" => "37851136"}, {"startDate" => "2013-10-14", "destination" => "Kreta, Bali", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75405535"}, {"startDate" => "2013-10-03", "destination" => "Hannover", "mainProductType" => "Camper", "allProductTypes" => ["Camper"], "id" => "37851137"}, {"startDate" => "2013-10-03", "destination" => "Balearen/Mallorca, Palma de Mallorca", "mainProductType" => "Mietwagen", "allProductTypes" => ["Mietwagen"], "id" => "36735928"}, {"startDate" => "2013-10-02", "destination" => "Kreta, Bali", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Unterkunft", "Zug", "Flug"], "id" => "75457052"}, {"startDate" => "2013-10-02", "destination" => "Freie und Hansestadt Hamburg, Hamburg", "mainProductType" => "Ticket", "allProductTypes" => ["Ticket"], "id" => "82334404"}, {"startDate" => "2013-10-02", "destination" => "Hurghada", "mainProductType" => "Flug", "allProductTypes" => ["Flug", "Flug"], "id" => "75405529"}, {"startDate" => "2013-10-02", "destination" => "Algarve, Faro", "mainProductType" => "Rundreise", "allProductTypes" => ["Rundreise"], "id" => "75405543"}, {"startDate" => "2013-09-30", "destination" => "Südafrika Westkap, Kapstadt/City", "mainProductType" => "Rundreise", "allProductTypes" => ["Rundreise"], "id" => "75405537"}, {"startDate" => "2013-09-24", "destination" => "TUI Deutschland", "mainProductType" => "Versicherung", "allProductTypes" => ["Versicherung"], "id" => "38072950"}, {"startDate" => "2013-09-23", "destination" => "Mallorca, Playa de Palma", "mainProductType" => "Unterkunft", "allProductTypes" => ["Unterkunft", "Unterkunft"], "id" => "75458682"}, {"startDate" => "2013-09-12", "destination" => "Costa de la Luz, Novo Sancti Petri", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Rundreise", "Versicherung", "Unterkunft", "Extra", "Flug"], "id" => "75405549"}, {"startDate" => "2013-09-03", "destination" => "Mallorca, Santa Ponsa", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75405528"}, {"startDate" => "2013-09-02", "destination" => "Mallorca, Arenal", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75457592"}, {"startDate" => "2013-09-02", "destination" => "Mallorca, Arenal", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75457620"}, {"startDate" => "2013-09-02", "destination" => "Mallorca, Bucht von Alcudia", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75457517"}, {"startDate" => "2013-09-02", "destination" => "Westpeloponnes, Kyllini", "mainProductType" => "Unterkunft", "allProductTypes" => ["Unterkunft"], "id" => "75405536"}, {"startDate" => "2013-09-02", "destination" => "Mallorca, Arenal", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75457619"}, {"startDate" => "2013-08-04", "destination" => "Teneriffa, Guia de Isora", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75405527"}, {"startDate" => "2013-08-03", "destination" => "Bayern-Nord, Passau", "mainProductType" => "Rundreise", "allProductTypes" => ["Rundreise"], "id" => "75405539"}, {"startDate" => "2013-07-27", "destination" => "Fuerteventura, Playa de Jandia", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Versicherung", "Unterkunft", "Flug"], "id" => "75405526"}, {"startDate" => "2013-07-03", "destination" => "Freie und Hansestadt Hamburg, Hamburg", "mainProductType" => "Ticket", "allProductTypes" => ["Ticket"], "id" => "82333023"}, {"startDate" => "2012-09-03", "destination" => "Südtürkische Ägäis, Fethiye", "mainProductType" => "Unterkunft", "allProductTypes" => ["Flug", "Rundreise", "Versicherung", "Transfer", "Unterkunft", "Flug"], "id" => "75307129"}, {"startDate" => "2012-07-03", "destination" => "Freie und Hansestadt Hamburg, Hamburg", "mainProductType" => "Ticket", "allProductTypes" => ["Ticket"], "id" => "82289338"}, {"startDate" => "2012-06-12", "destination" => "Freie und Hansestadt Hamburg, Hamburg", "mainProductType" => "Ticket", "allProductTypes" => ["Ticket"], "id" => "82288991"}, {"startDate" => "2012-05-21", "destination" => "Deutschland", "mainProductType" => "Zug", "allProductTypes" => ["Zug"], "id" => "1YWQGH"}, {"startDate" => "2012-05-05", "destination" => "Loire / Nivernais", "mainProductType" => "Boot", "allProductTypes" => ["Boot", "Extra"], "id" => "12061210"}]},
#    "selectedReservation" => "75511407", "agency" => {"title" => "Hier habe ich meinen Urlaub gebucht", "imageUrl" => "https://test.meine-tui.de/img/app/agency_default.jpg", "subTitle" => "TUI D IT - Management", "text" => "Sales- & Fulfillmentsystems\nM. Loehn\n\nKarl-Wiechert-Allee 23\nD 30625 Hannover", "phone" => "+49 511 567-4337", "email" => "Carmen.Scher@tui.de", "homepageUrl" => nil, "logo" => nil}, "countdownStartDateAsUnixTime" => 1409972400, "ttl" => 21600}, "name" => "HomeView"}
#

#TYPICAL_BOOKING={"payload" => {"destination" => "Costa de la Luz, Novo Sancti Petri", "userName" => "Peter Pan", "reservationCode" => "80522687", "brand" => "tui", "countdown" => {"startDateTimeAsUnixTime" => 1410321600, "endDateTimeAsUnixTime" => 1411509600, "status" => "countdown"}, "weather" => {"numberOfLocations" => 2, "data" => [{"name" => "Jerez de la Frontera", "type" => 6, "temperature" => 19, "temperatureFor" => "air"}, {"name" => "Faro", "type" => 2, "temperature" => 18, "temperatureFor" => "air"}]}, "bookingSummary" => {"brand" => "tui", "overview" => {"infoList" => [{"key" => "bookingCode", "value" => "80522687", "title" => "Vorgang/Buchungsnummer", "type" => "string", "order" => 1}, {"key" => "countdownStartDateAsUnixTime", "value" => 1410321600, "title" => "Countdown", "type" => "integer", "order" => 2}, {"key" => "leadPassenger", "value" => "Peter Pan", "title" => "Gebucht für", "type" => "string", "order" => 3}, {"key" => "otherPassengers", "value" => ["Petra Pan"], "title" => "Weitere Reisende", "type" => "array", "order" => 4}]}, "productDetails" => [{"flightTimesSubjectToChange" => true, "departureDateTime" => "2014-09-10T06:00:00", "departureAirportName" => "München", "departureAirportCode" => "MUC", "arrivalDateTime" => "2014-09-10T09:05:00", "arrivalAirportName" => "Jerez de la Frontera", "arrivalAirportCode" => "XRY", "carrierName" => "Condor", "cabinClassName" => "Economy Class", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "sectors" => [{"departureDateTime" => "2014-09-10T06:00:00", "departureAirportName" => "München", "departureAirportCode" => "MUC", "arrivalDateTime" => "2014-09-10T09:05:00", "arrivalAirportName" => "Jerez de la Frontera", "arrivalAirportCode" => "XRY", "carrierName" => "Condor", "carrierCode" => "DE", "flightNumber" => "3722", "cabinClassName" => "Economy Class", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => "1ST", "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => "2ND", "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "productType" => nil, "serviceId" => nil, "bookingCode" => nil}], "productType" => "flight", "serviceId" => "3343", "bookingCode" => nil}, {"productType" => "insurance", "serviceId" => "1052", "name" => "(RRV) Reiserücktritt-Plus ohne SB - pro Person", "supplierName" => "Lloyds Versicherer London", "startDate" => "2014-09-10", "endDate" => "2014-09-24", "numberOfPax" => 2, "emergencyNumber" => nil, "productTitle" => "(RRV) Reiserücktritt-Plus ohne SB - pro Person", "shortDescription" => nil, "longDescription" => nil, "bookingCode" => "L0/RRV"}, {"name" => "TUI best FAMILY RIU Chiclana", "destination" => "Costa de la Luz", "countryName" => "Spanien", "startDate" => "2014-09-10", "endDate" => "2014-09-17", "starRatingCodeName" => "****", "transferTypeName" => "Bustransfer inkl.", "rooms" => [{"name" => "Doppelzimmer Typ1", "boardName" => "mit All Inclusive", "passengers" => [{"fullName" => "Peter Pan"}, {"fullName" => "Petra Pan"}]}], "geoCoords" => {"latitude" => 36.334164395526, "longitude" => -6.1604456191574, "zoomLevel" => 10}, "productType" => "hotel", "serviceId" => "2367", "bookingCode" => "XRY16075"}, {"name" => "Upgrade ZzF 1. Kl. OW Rück (nur mit Hin buchbar - Gabelflug)", "supplierName" => "TUI Deutschland GMBH intern", "startDate" => "2014-09-10", "endDate" => nil, "locationName" => "Costa de la Luz", "numberOfPax" => "1", "passengers" => [{"fullName" => "Peter Pan"}], "productType" => "extra", "serviceId" => "1038", "bookingCode" => "ZZFXZROR"}, {"name" => "Clubhotel Riu Guarana", "destination" => "Algarve", "countryName" => "Portugal", "startDate" => "2014-09-17", "endDate" => "2014-09-24", "starRatingCodeName" => "****", "transferTypeName" => "Bustransfer inkl.", "rooms" => [{"name" => "Doppelzimmer Typ1", "boardName" => "mit All Inclusive", "passengers" => [{"fullName" => "Peter Pan"}, {"fullName" => "Petra Pan"}]}], "geoCoords" => {"latitude" => 37.092526718956, "longitude" => -8.1879220316515, "zoomLevel" => 10}, "productType" => "hotel", "serviceId" => "2368", "bookingCode" => "FAO21010"}, {"flightTimesSubjectToChange" => true, "departureDateTime" => "2014-09-24T10:30:00", "departureAirportName" => "Faro", "departureAirportCode" => "FAO", "arrivalDateTime" => "2014-09-24T14:45:00", "arrivalAirportName" => "München", "arrivalAirportCode" => "MUC", "carrierName" => "TUIfly", "cabinClassName" => "Economy Class", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "sectors" => [{"departureDateTime" => "2014-09-24T10:30:00", "departureAirportName" => "Faro", "departureAirportCode" => "FAO", "arrivalDateTime" => "2014-09-24T14:45:00", "arrivalAirportName" => "München", "arrivalAirportCode" => "MUC", "carrierName" => "TUIfly", "carrierCode" => "X3", "flightNumber" => "2821", "cabinClassName" => "Economy Class", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => "1ST", "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => "2ND", "fullName" => "Petra Pan"}], "productType" => nil, "serviceId" => nil, "bookingCode" => nil}], "productType" => "flight", "serviceId" => "3344", "bookingCode" => nil}, {"name" => "Upgrade ZzF 1. Kl. OW Hin (nur mit Rück buchbar - Gabelflug)", "supplierName" => "TUI Deutschland GMBH intern", "startDate" => "2014-09-24", "endDate" => nil, "locationName" => "Costa de la Luz", "numberOfPax" => "1", "passengers" => [{"fullName" => "Peter Pan"}], "productType" => "extra", "serviceId" => "1039", "bookingCode" => "ZZFXZROH"}], "name" => "ItineraryView", "messages" => nil, "ttl" => nil}, "products" => {"0" => {"title" => "Upgrade ZzF 1. Kl. OW Rück (nur mit Hin buchbar - Gabelflug)", "subTitle" => "Costa de la Luz", "location" => nil, "imageUrl" => nil, "productType" => "extra", "serviceId" => "1038", "reservationCode" => "80522687"}, "1" => {"title" => "Upgrade ZzF 1. Kl. OW Hin (nur mit Rück buchbar - Gabelflug)", "subTitle" => "Costa de la Luz", "location" => nil, "imageUrl" => nil, "productType" => "extra", "serviceId" => "1039", "reservationCode" => "80522687"}, "2" => {"title" => "Hereinspaziert!", "subTitle" => "TUI best FAMILY RIU Chiclana", "location" => nil, "imageUrl" => "https://mediacenter.tui-info.de/xmlprodpictures/tui/w0700_f04x03/i/il038515.jpg", "productType" => "hotel", "serviceId" => "2367", "reservationCode" => "80522687"}, "3" => {"title" => "Hereinspaziert!", "subTitle" => "Clubhotel Riu Guarana", "location" => nil, "imageUrl" => "https://mediacenter.tui-info.de/xmlprodpictures/tui/w0700_f04x03/d/de434273.jpg", "productType" => "hotel", "serviceId" => "2368", "reservationCode" => "80522687"}, "4" => {"title" => "Versicherung", "subTitle" => "(RRV) Reiserücktritt-Plus ohne SB - pro Person", "location" => nil, "imageUrl" => nil, "productType" => "insurance", "serviceId" => "1052", "reservationCode" => "80522687"}, "flight" => [{"departureAirportCode" => "MUC", "departureAirportName" => "München", "arrivalAirportCode" => "XRY", "arrivalAirportName" => "Jerez de la Frontera", "departureDateTime" => "2014-09-10T06:00:00", "arrivalDateTime" => "2014-09-10T09:05:00", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "title" => "Ihr Flug", "subTitle" => "Abflug am Mittwoch, 10. September 2014", "location" => nil, "imageUrl" => nil, "productType" => "flight", "serviceId" => "3343", "reservationCode" => "80522687"}, {"departureAirportCode" => "FAO", "departureAirportName" => "Faro", "arrivalAirportCode" => "MUC", "arrivalAirportName" => "München", "departureDateTime" => "2014-09-24T10:30:00", "arrivalDateTime" => "2014-09-24T14:45:00", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "title" => "Ihr Flug", "subTitle" => "Abflug am Mittwoch, 24. September 2014", "location" => nil, "imageUrl" => nil, "productType" => "flight", "serviceId" => "3344", "reservationCode" => "80522687"}]}, "destinationGuide" => {"numberOfLocations" => 2, "data" => {"ESP" => {"country3LC" => "ESP", "destinationName" => "Spanien", "imageUrl" => "http://www.tui-info.de/ICAT/mediadata/laenderbilder/ESP.jpg"}, "PRT" => {"country3LC" => "PRT", "destinationName" => "Portugal", "imageUrl" => "http://www.tui-info.de/ICAT/mediadata/laenderbilder/PRT.jpg"}}}, "excursions" => {"excursionCount" => 51, "imageUrl" => "https://mediacenter.tui-info.de/meinetui/app/img/excursion.jpg", "numberOfLocations" => 2}, "meetYourRep" => [{"title" => "Ihre Reiseleitung", "name" => "Frau Anabela Costa", "imageUrl" => "https://meinservice.blob.core.windows.net/prod-image-app/d3b7f653078ca93159d27e9c31dad859d491af3b.jpg"}], "goodToKnow" => {"numberOfLocations" => 2, "data" => {"ESP" => {"country3LC" => "ESP", "destinationName" => "Spanien"}, "PRT" => {"country3LC" => "PRT", "destinationName" => "Portugal"}}}, "currency" => nil, "travelAgent" => true, "tuiService" => true, "contact" => true, "ttl" => 21600}, "name" => "HomeScreenView"}
#INSURANCE_BOOKING={"payload" => {"destination" => "TUI Deutschland", "userName" => "Peter Pan", "reservationCode" => "38072949", "brand" => "tui", "countdown" => {"startDateTimeAsUnixTime" => 1372802400, "endDateTimeAsUnixTime" => 1467410400, "status" => "started"}, "weather" => nil, "bookingSummary" => {"brand" => "tui", "overview" => {"infoList" => [{"key" => "bookingCode", "value" => "38072949", "title" => "Vorgang/Buchungsnummer", "type" => "string", "order" => 1}, {"key" => "countdownStartDateAsUnixTime", "value" => 1372802400, "title" => "Countdown", "type" => "integer", "order" => 2}, {"key" => "leadPassenger", "value" => "Peter Pan", "title" => "Gebucht für", "type" => "string", "order" => 3}, {"key" => "otherPassengers", "value" => ["Petra Pan"], "title" => "Weitere Reisende", "type" => "array", "order" => 4}]}, "productDetails" => [{"productType" => "insurance", "serviceId" => "903", "name" => "Jahres-Rechtsschutz", "supplierName" => "Europäische Reiseversicherung AG", "startDate" => "2013-07-03", "endDate" => "2016-07-02", "numberOfPax" => 2, "emergencyNumber" => "+49 (0)89 41 66 17 99", "productTitle" => "Jahres-Rechtsschutz", "shortDescription" => nil, "longDescription" => "Jahres-Reiserechtsschutz-Versicherung (mit Selbstbeteiligung)<br/>Gültig für alle Reisen weltweit bis zu jeweils 45 Tagen ¿ <br/>innerhalb des Landes, in dem die versicherte Person einen<br/>ständigen Wohnsitz hat, jedoch nur, wenn die Entfernung<br/>zwischen Wohnort bzw. Arbeitsstätte und Zielort mehr als 50<br/>Kilometer beträgt. Bei Reisen mit einer Dauer von mehr als 45<br/>Tagen besteht Versicherungsschutz nur für die ersten 45 Tage.<br/>Hauptberufliche Außendiensttätigkeit, Gänge und Fahrten<br/>zwischen dem ständigen Wohnsitz und der Arbeitsstätte sowie<br/>Tagesausflüge innerhalb Deutschlands (bis zu 24 Stunden, ohne<br/>Übernachtung) gelten nicht als Reise.<br/>Reiserechtsschutz-Versicherung<br/>Versicherungssumme: EUR 50.000,- je Versicherungsfall<br/>mit Selbstbeteiligung gem. Par. 7<br/>Tarif pro Einzelperson: JSA15<br/>Tarif pro Familie: JSC15<br/>Definition Familie: Als Familie gelten maximal zwei Erwachsene<br/>bis einschließlich 64 Jahre in häuslicher Gemeinschaft sowie<br/>deren Kind(er) bis einschließlich 25 Jahre.<br/>Geltungsbereich: Weltweit.<br/>Es gelten die Versicherungsbedingungen für die<br/>Reiserechtsschutz-Versicherung der D.A.S. Deutscher Automobil<br/>Schutz Allgemeine Rechtsschutz-Versicherungs-AG (VB-DAS 2011T).", "bookingCode" => "1001"}], "name" => "ItineraryView", "messages" => nil, "ttl" => nil}, "products" => [{"title" => "Versicherung", "subTitle" => "Jahres-Rechtsschutz", "location" => nil, "imageUrl" => nil, "productType" => "insurance", "serviceId" => "903", "reservationCode" => "38072949"}], "destinationGuide" => nil, "excursions" => nil, "meetYourRep" => nil, "goodToKnow" => nil, "currency" => nil, "travelAgent" => true, "tuiService" => nil, "contact" => true, "ttl" => 21600}, "name" => "HomeScreenView"}
#FLIGHT_BOOKING={"payload" => {"destination" => "Palma de Mallorca", "userName" => "Peter Pan", "reservationCode" => "75511407", "brand" => "tui", "countdown" => {"startDateTimeAsUnixTime" => 1409972400, "endDateTimeAsUnixTime" => 1409954400, "status" => "countdown"}, "weather" => {"numberOfLocations" => 1, "data" => [{"name" => "Palma de Mallorca", "type" => 0, "temperature" => 16, "temperatureFor" => "air"}]}, "bookingSummary" => {"brand" => "tui", "overview" => {"infoList" => [{"key" => "bookingCode", "value" => "75511407", "title" => "Vorgang/Buchungsnummer", "type" => "string", "order" => 1}, {"key" => "countdownStartDateAsUnixTime", "value" => 1409972400, "title" => "Countdown", "type" => "integer", "order" => 2}, {"key" => "leadPassenger", "value" => "Peter Pan", "title" => "Gebucht für", "type" => "string", "order" => 3}, {"key" => "otherPassengers", "value" => ["Petra Pan"], "title" => "Weitere Reisende", "type" => "array", "order" => 4}]}, "productDetails" => [{"flightTimesSubjectToChange" => true, "departureDateTime" => "2014-09-06T05:00:00", "departureAirportName" => "Hannover", "departureAirportCode" => "HAJ", "arrivalDateTime" => "2014-09-06T07:30:00", "arrivalAirportName" => "Palma de Mallorca", "arrivalAirportCode" => "PMI", "carrierName" => "Germanwings", "cabinClassName" => "Economy Class", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "sectors" => [{"departureDateTime" => "2014-09-06T05:00:00", "departureAirportName" => "Hannover", "departureAirportCode" => "HAJ", "arrivalDateTime" => "2014-09-06T07:30:00", "arrivalAirportName" => "Palma de Mallorca", "arrivalAirportCode" => "PMI", "carrierName" => "Germanwings", "carrierCode" => "GWI", "flightNumber" => "5000", "cabinClassName" => "Economy Class", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => "NONE", "arrivalAirportRailClass" => "NONE", "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => "NONE", "arrivalAirportRailClass" => "NONE", "fullName" => "Petra Pan"}], "productType" => nil, "serviceId" => nil, "bookingCode" => nil}], "productType" => "flight", "serviceId" => "3318", "bookingCode" => nil}], "name" => "ItineraryView", "messages" => nil, "ttl" => nil}, "products" => {"flight" => [{"departureAirportCode" => "HAJ", "departureAirportName" => "Hannover", "arrivalAirportCode" => "PMI", "arrivalAirportName" => "Palma de Mallorca", "departureDateTime" => "2014-09-06T05:00:00", "arrivalDateTime" => "2014-09-06T07:30:00", "passengers" => [{"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Peter Pan"}, {"seatRow" => nil, "seatColumn" => nil, "departureAirportRailClass" => nil, "arrivalAirportRailClass" => nil, "fullName" => "Petra Pan"}], "title" => "Ihr Flug", "subTitle" => "Abflug am Samstag, 06. September 2014", "location" => nil, "imageUrl" => nil, "productType" => "flight", "serviceId" => "3318", "reservationCode" => "75511407"}]}, "destinationGuide" => {"numberOfLocations" => 1, "data" => {"ESP" => {"country3LC" => "ESP", "destinationName" => "Spanien", "imageUrl" => "http://www.tui-info.de/ICAT/mediadata/laenderbilder/ESP.jpg"}}}, "excursions" => {"excursionCount" => 61, "imageUrl" => "https://mediacenter.tui-info.de/meinetui/app/img/excursion.jpg", "numberOfLocations" => 1}, "meetYourRep" => nil, "goodToKnow" => {"numberOfLocations" => 1, "data" => {"ESP" => {"country3LC" => "ESP", "destinationName" => "Spanien"}}}, "currency" => nil, "travelAgent" => true, "tuiService" => true, "contact" => true, "ttl" => 21600}, "name" => "HomeScreenView"}
#NON_EU_BOOKING={"payload" => {"destination" => "Thailand", "userName" => "Peter Pan", "reservationCode" => "80522737", "brand" => "tui", "countdown" => {"startDateTimeAsUnixTime" => 1410793200, "endDateTimeAsUnixTime" => 1410732000, "status" => "countdown"}, "weather" => nil, "bookingSummary" => {"brand" => "tui", "overview" => {"infoList" => [{"key" => "bookingCode", "value" => "80522737", "title" => "Vorgang/Buchungsnummer", "type" => "string", "order" => 1}, {"key" => "countdownStartDateAsUnixTime", "value" => 1410793200, "title" => "Countdown", "type" => "integer", "order" => 2}, {"key" => "leadPassenger", "value" => "Peter Pan", "title" => "Gebucht für", "type" => "string", "order" => 3}, {"key" => "otherPassengers", "value" => [], "title" => "Weitere Reisende", "type" => "array", "order" => 4}]}, "productDetails" => [{"name" => "Flughafen Bangkok - Hotel Bangkok (Minibus 1-5 Pers.)", "startDateTime" => "2014-09-15T17:00:00", "endDateTime" => "2014-09-15T00:00:00", "numberOfAdults" => 1, "numberOfChildren" => 0, "numberOfInfants" => 0, "numberOfPax" => 1, "productType" => "transfer", "serviceId" => "225", "bookingCode" => "BKKXMV01"}], "name" => "ItineraryView", "messages" => nil, "ttl" => nil}, "products" => [{"title" => "Flughafen Bangkok - Hotel Bangkok (Minibus 1-5 Pers.)", "subTitle" => nil, "location" => nil, "imageUrl" => nil, "productType" => "transfer", "serviceId" => "225", "reservationCode" => "80522737"}], "destinationGuide" => {"numberOfLocations" => 1, "data" => {"THA" => {"country3LC" => "THA", "destinationName" => "Thailand", "imageUrl" => "http://www.tui-info.de/ICAT/mediadata/laenderbilder/THA.jpg"}}}, "excursions" => nil, "meetYourRep" => nil, "goodToKnow" => {"numberOfLocations" => 1, "data" => {"THA" => {"country3LC" => "THA", "destinationName" => "Thailand"}}}, "currency" => {"fromCurrency" => "EUR", "THB" => "44.45300"}, "travelAgent" => true, "tuiService" => nil, "contact" => true, "ttl" => 21600}, "name" => "HomeScreenView"}
#

#Avoid calling this method directly
def get_user_details(url)
  username=USERS[:valid][:username]
  password=USERS[:valid][:password]
  query_url=url||'http://37.46.24.155:3000/reservations'
  server_url="http://37.46.24.155:3000/login"
  $g_session_id=$g_session_id||`curl --data "username=#{username}&password=#{password}" '#{server_url}'`

  m=$g_session_id.match('(PHP(.*)path=\/)')
  res=`curl --header 'tui-auth-key:#{m[1]}' #{query_url}`
  parsed=JSON.parse(res)
  return parsed
end

if $g_current_app== "DE_MT"
  USER_INFO=get_user_details('http://37.46.24.155:3000/reservations')

  booking_id=75511486
  TYPICAL_BOOKING||=get_user_details('http://37.46.24.155:3000/reservation/'+booking_id.to_s+'/home')

  booking_id=75511407
  FLIGHT_BOOKING||= get_user_details('http://37.46.24.155:3000/reservation/'+booking_id.to_s+'/home')

  booking_id=80522737
  NON_EU_BOOKING||= get_user_details('http://37.46.24.155:3000/reservation/'+booking_id.to_s+'/home')
end