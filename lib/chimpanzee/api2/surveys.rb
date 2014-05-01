module Chimpanzee
  module Api2
    class Surveys

      include MissingMethod

      def export_survey_responses_to_csv_array(survey_id, survey=nil)
        survey ||= self.get_survey_details survey_id: survey_id
        respondents = self.get_respondent_list survey_id: survey_id
        respondents = self.extract_respondents(respondents)
        questions = self.map_questions(survey)
        answers = map_answers(survey)
        responses = self.get_responses  survey_id: survey_id,
          respondent_ids: respondents
        responses = self.map_responses(responses, answers)
        build_csv_array(questions, answers, responses)
      end

      ## builds CSV array ready to be exported to ie. Excel
      ## First row acts as title row
      def build_csv_array(questions, answers, responses)
        csv_array = []
        if questions
          title_row = ['respondent id']
          questions_order = []
          questions.each.each do |key, q|
            title_row << q
            questions_order << key
          end
          csv_array << title_row
          responses.each do |key, response|
            row = [key]
            questions_order.each do |qid|
              row << (response[qid] || []).join(", ")
            end
            csv_array << row
          end
        end
        csv_array
      end

      ## Create more readable structure with responses
      ## Hash - key -> respondent id, value: hash with key of question_id
      ## Anwers are array of texts
      def map_responses(responses_raw, answers)
        responses = {}
        if responses_raw && responses_raw['data'].present?
          responses_raw['data'].each do |response|
            response_hash = {}
            response['questions'].each do |question|
              answer_array = []
              question['answers'].each do |answer|
                answer_array << (answer['text'] || answers[answer['col']])
              end
              response_hash[question['question_id']] = answer_array
            end
            responses[response['respondent_id']] = response_hash
          end
        end

        responses
      end

      def extract_respondents(respondents)
        respondents_array = []
        if respondents && respondents['data'].present? && respondents['data']['respondents'].present?
          respondents['data']['respondents'].each do |respondent|
            respondents_array << respondent['respondent_id']#.to_i
          end
        end
        respondents_array
      end

      def map_questions(survey)
        questions = {}
        if survey && survey['data'].present? && survey['data']['pages'].present?
          survey['data']['pages'].each do |page|
            page['questions'].each do |question|
              questions[question['question_id']] = question['heading']
            end
          end
        end
        questions
      end

      def map_answers(survey)
        answers = {}
        if survey && survey['data'].present? && survey['data']['pages'].present?
          survey['data']['pages'].each do |page|
            page['questions'].each do |question|
              question['answers'].each do |answer|
                answers[answer['answer_id']] = answer['weight'] || answer['text']
              end
            end
          end
        end
        answers
      end
    end
  end
end
