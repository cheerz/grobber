RSpec.describe Grobber::Image do

  before(:all) do
    FileUtils.rm_rf('tmp/images')
    FileUtils.mkdir_p('tmp/images')
  end

  it 'writes an image' do
    file_path = 'tmp/images/image.jpg'
    Grobber::Image.new('foo').write(file_path)
    expect(File.exists?(file_path)).to eq(true)
  end

end