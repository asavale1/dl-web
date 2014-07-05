#
# => title			varchar(255)
# => description	text
# => tag			text
# => xml			attachment
#
class Packet < ActiveRecord::Base
	has_attached_file :xml
	validates_attachment_content_type :xml, :content_type => ["text/xml", "application/xml"] 
end