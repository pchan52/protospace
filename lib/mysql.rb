def write(data)
 if data.is_a? Array then
   data = data.join
 end
 @sock.sync = false
 ptr = 0
 while data.length >= MAX_PACKET_LENGTH do
   @sock.write Net::int3str(MAX_PACKET_LENGTH)+@pkt_nr.chr+data[ptr, MAX_PACKET_LENGTH]
   @pkt_nr = @pkt_nr + 1 & 0xff
   ptr += MAX_PACKET_LENGTH
 end
 begin
   @sock.write Net::int3str(data.length-ptr)+@pkt_nr.chr+data[ptr .. -1]
   @pkt_nr = @pkt_nr + 1 & 0xff
   @sock.sync = true
   @sock.flush
 rescue
   errno = Error::CR_SERVER_LOST
   raise Error::new(errno, Error::err(errno))
 end
end
