describe_recipe 'ps2dev::default' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  %w(gcc git-core make patch wget).each do |pkg|
    it "installs the package #{pkg}" do
      package(pkg).must_be_installed
    end
  end

  %w(ee-gcc iop-gcc ps2client).each do |tool|
    it "installs the tool #{tool}" do
      assert system("which #{tool}")
    end
  end

  it "installs the PS2 SDK" do
    directory("/usr/local/ps2dev/ps2sdk").must_exist
  end

  it "ensures that environment variables are set" do
    env_file = file("/etc/profile.d/ps2dev.sh")
    env_file.must_exist
    env_file.must_match /^export PS2DEV=/
    env_file.must_match /^export PS2SDK=/
    env_file.must_match /^export PATH=/
  end

  it "ensures that the build directory is removed" do
    directory("/tmp/toolchain").wont_exist
  end
end
