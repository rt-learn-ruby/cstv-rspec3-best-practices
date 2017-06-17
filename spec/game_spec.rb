require 'spec_helper'

describe Game do
  subject(:game) { described_class.new }

  describe '#call' do
    let(:description) { |example| example.description }

    context 'when the choices are different' do
      it 'rock beats scissors' do
        expect(subject.call('rock', 'scissors')).to eq(description)
      end
    end

    context 'when the choicen are the same' do
      it 'draw' do
        expect(subject.call('rock', 'rock')).to eq(description)
      end
    end
  end

  describe '#get_user_input' do
    let(:description_message) { "Please select rock paper or scissor\n" }

    before do
      allow(subject).to receive(:gets).and_return('rock')
    end

    it 'prompts the user with the instructions' do
      expect { subject.get_user_input }.to output(description_message).to_stdout
    end

    it 'returned what the user typed as input' do
      allow(subject).to receive(:puts)
      expect(subject.get_user_input).to eq('rock')
    end
  end

  describe '#game' do
    before do
      allow(subject).to receive(:get_user_input).and_return('paper')
      allow(subject).to receive(:rand_choice).and_return('rock')
    end

    let(:message) do
      "paper beats rock\n"
    end

    it 'take in the users input and output the winning message' do
      expect { game.play }.to output(message).to_stdout
    end
  end
end
