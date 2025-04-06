import React, { useEffect, useState } from "react"

function useLocalStorage(key: any, value: any) {
  const [state, setState] = useState(value)
  // useEffect(() => {
  //   setItem()
  // }, [key, value])
  if (localStorage.getItem(key)) {
    const localValue = JSON.parse(localStorage.getItem(key))
    console.log(key)
    console.log("local value", localValue)
    // setState(localValue)
  }

  if (typeof value === "function") {
    return localStorage.setItem(key, JSON.stringify(value()))
  }

  // localStorage.setItem(key, JSON.stringify(value))

  return [state, setState]
}

export default useLocalStorage
