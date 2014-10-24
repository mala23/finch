require 'spec_helper.rb'

describe Peep do

  context "testing database" do

    it 'should be created and then retrieved from the database' do
      expect(Peeps.count).to eq(0)
      Peeps.create(:name => "Foo Bar",
                   :username => "foobar",
                   :content => "Hello world!")
      expect(Peeps.count).to eq(1)
      peep = Peeps.first
      expect(peep.name).to eq("Foo Bar")
      expect(peep.username).to eq("foobar")
      expect(peep.content).to eq("Hello world!")
      peep.destroy
      expect(Peeps.count).to eq(0)
    end

  end

end
