tftarget() {
  # Potential SECURITY RISK: note that plan files *may* contain sensitive data; I
  # need to research more.  I don't know if they are like state files or not.
  #
  # This is why i put the plan in the CWD and not something like /tmp where you
  # may forget about it
  local plan=./tftarget.plan

  local targets=()
  for resource in $@ ; do
    targets+=("-target" "$resource")
  done

  terraform plan "${targets[@]}" -out "$plan"
  terraform apply $plan
}


#-------------------------------------------------------------------------------
# [aliases]] {{{
#-------------------------------------------------------------------------------

  alias tfa="terraform apply"
  alias tfp="terraform plan"
  alias tfpt="terraform plan -target"

# }}}
