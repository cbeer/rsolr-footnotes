require 'spec_helper'

describe Rsolr::Footnotes do
  it 'has a version number' do
    expect(Rsolr::Footnotes::VERSION).not_to be nil
  end

  it 'adds notification to rsolr' do
    @mock_controller = double
    Rsolr::Footnotes.setup_rsolr_notifications!

    Footnotes::Notes::RsolrRequestsNote.start!(@mock_controller)

    @note = Footnotes::Notes::RsolrRequestsNote.new(@mock_controller)
    @mock_connection = double()
    allow(@mock_connection).to receive(:execute).and_return(body: '{}', headers: nil, status: 200)

    @solr = RSolr.connect url: 'http://solrserver.example.com'
    allow(@solr).to receive(:connection).and_return(@mock_connection)

    @solr.head("admin/ping")
    expect(@note.events.length).to eq 1
    expect(@note.events.first.path).to eq "admin/ping"
  end
end
