
!define(pbuh)(
  !pdf(\pbuh)
  !html((Peace and Blessings of Allāh be upon him))
)

!define(p)(
  !ifeq(!1)(him)(
    !pdf(\mabpwhim)
    !html((May Allāh be pleased with him))
  )

  !ifeq(!1)(her)(
    !pdf(\mabpwher)
    !html((May Allāh be pleased with her))
  )

  !ifeq(!1)(themtwo)(
    !pdf(\mabpwthemtwo)
    !html((May Allāh be pleased with them))
  )

  !ifeq(!1)(them)(
    !pdf(\mabpwthem)
    !html((May Allāh be pleased with them))
  )

  !ifeq(!1)(themf)(
    !pdf(\mabpwthemf)
    !html((May Allāh be pleased with them))
  )
)

!define(s)(
  !ifeq(!1)(him)(
    !pdf(\salamhim)
    !html()
  )
  !ifeq(!1)(them)(
    !pdf(\salamthem)
    !html()
  )
)

The Prophet !pbuh.
Male Companion !p[him].
Female Companion !p[her].
Those two !p[themtwo].
Those people !p[them].
Those women !p[themf].

