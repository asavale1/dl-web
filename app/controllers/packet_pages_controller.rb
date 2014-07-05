class PacketPagesController < ApplicationController
	include PacketPagesHelper

	def dashboard

	end

	def create_packet
		@index = 0
	end

	def submit_packet
		packet = Packet.new
		packet.title = params[:title]
		packet.description = params[:desc]
		packet.tag = params[:tags]
		#packet.xml = create_xml(params)
		#packet.save
		render action: "create_packet"
		#redirect_to action: "create_packet"
	end

	def render_question
		@index = params[:index].to_i + 1
		question_render = get_question_layout(params[:type])

		render :json => {
			:html => question_render,
			:index => @index
		}
	end

	def check_title
		puts params[:title]
		packet = Packet.where("title = ?", params[:title].strip)
		puts "THERE"
		puts packet.length
		puts "HERE"
		if packet.length == 0
			render :json => { :valid => true }
		else
			render :json => { :valid => false }
		end
	end
end