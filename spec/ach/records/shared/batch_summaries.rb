# frozen_string_literal: true

# Include with:
#
#     self.instance_eval(&shared_examples_for_batch_summaries)

module SharedExamples
  def self.batch_summaries
    proc do
      describe '#service_class_code' do
        it ' accepts an Integer' do
          @record.service_class_code = 200
          expect(@record.service_class_code).to eq(200)
          expect(@record.service_class_code_to_ach).to eq('200')
        end

        it 'accepts a String' do
          @record.service_class_code = '220'
          expect(@record.service_class_code).to eq('220')
          expect(@record.service_class_code_to_ach).to eq('220')
        end

        it 'must be a 200, 220, 225 or 280' do
          expect { @record.service_class_code = '201' }
            .to raise_error(RuntimeError)
          expect { @record.service_class_code = 201 }
            .to raise_error(RuntimeError)
          expect { @record.service_class_code = '2020' }
            .to raise_error(RuntimeError)
          expect { @record.service_class_code = '20' }
            .to raise_error(RuntimeError)
        end

        describe '#service_class_code_to_ach' do
          it 'uses a given value' do
            @record.service_class_code = '220'
            expect(@record.service_class_code_to_ach).to eq('220')
            @record.service_class_code = '225'
            expect(@record.service_class_code_to_ach).to eq('225')
          end

          it 'defaults to 200 when entries are unavailable' do
            expect(@record.service_class_code_to_ach).to eq('200')
          end
        end
      end
    end
  end
end
