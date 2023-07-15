//
//  StatusCode.swift
//  KNetworking
//
//  Created by Kiarash Vosough on 7/13/23.
//

public enum StatusCode: Int {
    case Continue           = 100 // RFC 9110, 15.2.1
    case SwitchingProtocols = 101 // RFC 9110, 15.2.2
    case Processing         = 102 // RFC 2518, 10.1
    case EarlyHints         = 103 // RFC 8297

    case OK                   = 200 // RFC 9110, 15.3.1
    case Created              = 201 // RFC 9110, 15.3.2
    case Accepted             = 202 // RFC 9110, 15.3.3
    case NonAuthoritativeInfo = 203 // RFC 9110, 15.3.4
    case NoContent            = 204 // RFC 9110, 15.3.5
    case ResetContent         = 205 // RFC 9110, 15.3.6
    case PartialContent       = 206 // RFC 9110, 15.3.7
    case MultiStatus          = 207 // RFC 4918, 11.1
    case AlreadyReported      = 208 // RFC 5842, 7.1
    case IMUsed               = 226 // RFC 3229, 10.4.1

    case MultipleChoices   = 300 // RFC 9110, 15.4.1
    case MovedPermanently  = 301 // RFC 9110, 15.4.2
    case Found             = 302 // RFC 9110, 15.4.3
    case SeeOther          = 303 // RFC 9110, 15.4.4
    case NotModified       = 304 // RFC 9110, 15.4.5
    case UseProxy          = 305 // RFC 9110, 15.4.6
    case unused            = 306 // RFC 9110, 15.4.7 (Unused)
    case TemporaryRedirect = 307 // RFC 9110, 15.4.8
    case PermanentRedirect = 308 // RFC 9110, 15.4.9

    case BadRequest                   = 400 // RFC 9110, 15.5.1
    case Unauthorized                 = 401 // RFC 9110, 15.5.2
    case PaymentRequired              = 402 // RFC 9110, 15.5.3
    case Forbidden                    = 403 // RFC 9110, 15.5.4
    case NotFound                     = 404 // RFC 9110, 15.5.5
    case MethodNotAllowed             = 405 // RFC 9110, 15.5.6
    case NotAcceptable                = 406 // RFC 9110, 15.5.7
    case ProxyAuthRequired            = 407 // RFC 9110, 15.5.8
    case RequestTimeout               = 408 // RFC 9110, 15.5.9
    case Conflict                     = 409 // RFC 9110, 15.5.10
    case Gone                         = 410 // RFC 9110, 15.5.11
    case LengthRequired               = 411 // RFC 9110, 15.5.12
    case PreconditionFailed           = 412 // RFC 9110, 15.5.13
    case RequestEntityTooLarge        = 413 // RFC 9110, 15.5.14
    case RequestURITooLong            = 414 // RFC 9110, 15.5.15
    case UnsupportedMediaType         = 415 // RFC 9110, 15.5.16
    case RequestedRangeNotSatisfiable = 416 // RFC 9110, 15.5.17
    case ExpectationFailed            = 417 // RFC 9110, 15.5.18
    case Teapot                       = 418 // RFC 9110, 15.5.19 (Unused)
    case MisdirectedRequest           = 421 // RFC 9110, 15.5.20
    case UnprocessableEntity          = 422 // RFC 9110, 15.5.21
    case Locked                       = 423 // RFC 4918, 11.3
    case FailedDependency             = 424 // RFC 4918, 11.4
    case TooEarly                     = 425 // RFC 8470, 5.2.
    case UpgradeRequired              = 426 // RFC 9110, 15.5.22
    case PreconditionRequired         = 428 // RFC 6585, 3
    case TooManyRequests              = 429 // RFC 6585, 4
    case RequestHeaderFieldsTooLarge  = 431 // RFC 6585, 5
    case UnavailableForLegalReasons   = 451 // RFC 7725, 3

    case InternalServerError           = 500 // RFC 9110, 15.6.1
    case NotImplemented                = 501 // RFC 9110, 15.6.2
    case BadGateway                    = 502 // RFC 9110, 15.6.3
    case ServiceUnavailable            = 503 // RFC 9110, 15.6.4
    case GatewayTimeout                = 504 // RFC 9110, 15.6.5
    case HTTPVersionNotSupported       = 505 // RFC 9110, 15.6.6
    case VariantAlsoNegotiates         = 506 // RFC 2295, 8.1
    case InsufficientStorage           = 507 // RFC 4918, 11.5
    case LoopDetected                  = 508 // RFC 5842, 7.2
    case NotExtended                   = 510 // RFC 2774, 7
    case NetworkAuthenticationRequired = 511 // RFC 6585, 6

    case unknown = -1
}
