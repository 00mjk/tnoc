function automatic int calc_request_header_flits();
  return (REQUEST_HEADER_WIDTH + FLIT_DATA_WIDTH - 1) / FLIT_DATA_WIDTH;
endfunction

function automatic int calc_response_header_flits();
  return (RESPONSE_HEADER_WIDTH + FLIT_DATA_WIDTH - 1) / FLIT_DATA_WIDTH;
endfunction

function automatic int calc_header_flits();
  return (HEADER_WIDTH + FLIT_DATA_WIDTH - 1) / FLIT_DATA_WIDTH;
endfunction

function automatic logic is_header_flit(input tnoc_flit flit);
  return (flit.flit_type == TNOC_HEADER_FLIT) ? '1 : '0;
endfunction

function automatic logic is_payload_flit(input tnoc_flit flit);
  return (flit.flit_type == TNOC_PAYLOAD_FLIT);
endfunction

function automatic logic is_head_flit(input tnoc_flit flit);
  return flit.head;
endfunction

function automatic logic is_tail_flit(input tnoc_flit flit);
  return flit.tail;
endfunction

function automatic tnoc_common_header get_common_header(input tnoc_flit flit);
  return tnoc_common_header'(flit.data[COMMON_HEADER_WIDTH-1:0]);
endfunction

function automatic tnoc_write_payload get_write_payload(input tnoc_flit flit);
  return tnoc_write_payload'(flit.data[WRITE_PAYLOAD_WIDTH-1:0]);
endfunction

function automatic tnoc_read_payload get_read_payload(input tnoc_flit flit);
  return tnoc_read_payload'(flit.data[READ_PAYLOAD_WIDTH-1:0]);
endfunction
