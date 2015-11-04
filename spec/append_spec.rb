require_relative 'spec_helper'

describe 'test::append' do
  let(:chef_run) do
    ChefSpec::Runner.new(step_into: ['append_line']).converge described_recipe
  end

  context '/test1' do
    it 'expect append_line matcher to run' do
      expect(chef_run).to run_append_line('/test1')
    end

    it 'expect ruby block to run' do
      expect(chef_run).to run_ruby_block('/test1')
    end
  end

  context 'test2' do
    it 'expect append_line matcher to run' do
      expect(chef_run).to run_append_line('test2')
    end

    it 'expect ruby block to run' do
      expect(chef_run).to run_ruby_block('test2')
    end
  end

  context 'test3' do
    it 'expect append_line matcher to not run' do
      expect(chef_run).not_to run_append_line('test3')
    end
  end
end
