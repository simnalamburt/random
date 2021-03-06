# frozen_string_literal: true
require 'sinatra'
require 'tilt/erubis'

get '/' do
  gen1 = ['소희', '세린이형', '현일이형'].shuffle
  gen2 = %w( kcm 동진 장호 지현 ).shuffle
  gen3 = %w( 윤미누나 은서 다윤 가온 ).shuffle
  @groups = []
  for i in 0...4
    @groups[i] = [gen1[i], gen2[i], gen3[i]].reject(&:nil?).shuffle.join(', ')
  end
  @groups.sample.concat '<span style="color: #ccc">, 재성이형</span>'

  erb :index
end
