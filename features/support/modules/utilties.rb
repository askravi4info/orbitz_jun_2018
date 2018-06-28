module Utilities

  def verify_both_results_are_same? actual_results, expected_results
    if actual_results.include? expected_results
      p "#{actual_results} is same as #{expected_results}"
    else
      fail "#{actual_results} is NOT same as #{expected_results}"
    end
  end

  def change_date no_days
    changed_date  = Time.now + 60*60*24*no_days
    changed_date.strftime("%m/%d/%y")
  end

  def date_in_results_format no_days
    changed_date  = Time.now + 60*60*24*no_days
    changed_date.strftime("%a, %b %d")
  end

end