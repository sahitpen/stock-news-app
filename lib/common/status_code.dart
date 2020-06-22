enum StatusCode { OK, UNAUTHORIZED, NOT_FOUND, BAD_REQUEST }

StatusCode toStatusCode(int httpStatus) {
  switch (httpStatus) {
    case 200:
      return StatusCode.OK;
      break;
    case 400:
      return StatusCode.BAD_REQUEST;
      break;
    case 401:
      return StatusCode.UNAUTHORIZED;
      break;
    case 404:
      return StatusCode.NOT_FOUND;
      break;
    default:
      return null;
  }
}
