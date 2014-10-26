require 'spec_helper.rb'

feature "User composes a new peep" do
	
	scenario "when browsing finch" do
		expect(Peep.count).to eq(0)
		visit '/'
		# save_and_open_page
		compose_peep("Hello world!")
		expect(Peep.count).to eq(1)
		peep = Peep.first
		expect(peep.content).to eq("Hello world!")
	end

	def compose_peep(content, username)
		within ('#compose-peep') do
			fill_in 'content', :with => content
			click_button 'Peep!'
		end
	end

end