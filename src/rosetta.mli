type encoding = [ `UTF_7 | Uuuu.encoding | Coin.encoding ]

val encoding_of_string: string -> encoding
val encoding_to_string: encoding -> string

type 'kind decoder constraint 'kind = [< encoding ]
type src = [ `Manual | `Channel of in_channel | `String of string ]
type decode = [ `Await | `End | `Uchar of Uchar.t | `Malformed of string ]

val src: encoding decoder -> Bytes.t -> int -> int -> unit

val decoder: encoding -> src -> encoding decoder

val decode: encoding decoder -> decode

val decoder_line: encoding decoder -> int
val decoder_column: encoding decoder -> int
val decoder_byte_count: encoding decoder -> int
val decoder_src: encoding decoder -> src
val decoder_kind: encoding decoder -> encoding
