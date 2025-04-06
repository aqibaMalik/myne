import { FormEvent, useCallback, useEffect, useMemo, useState } from "react"
import "./App.css"
import molePic from "./assets/mole.jpeg"
import holePic from "./assets/hole.jpeg"
import useLocalStorage from "./hooks/useLocalStorage"

const initialState = new Array(9).fill({ status: false, clicked: false })
function App() {
  const [moles, setMoles] = useState(initialState)
  const [score, setScore] = useState(0)
  const [highScore, setHighScore] = useMemo(
    () => useLocalStorage("high-score", 0),
    []
  )

  const handleGameOver = () => {
    setScore(0)
    document.querySelector(".grid")!.classList.add("shake")
    setTimeout(() => {
      document.querySelector(".grid")!.classList.remove("shake")
    }, 200)
    if (score > highScore) {
      setHighScore(score)
    }
  }

  const handleMole = (e: FormEvent, idx: number) => {
    const { x, y } = e.target

    if (!moles[idx].clicked && moles[idx].status) {
      setMoles((pvMoles) =>
        pvMoles.map((_, id) =>
          id === idx ? { ..._, clicked: true } : { ..._, clicked: false }
        )
      )
      setScore(score + 1)
      document.body.classList.add("hit")
      console.log(document.body.style.getPropertyValue("--top"))
      document.body.style.setProperty("--top", `${y + 30}px`)
      document.body.style.setProperty("--left", `${x + 30}px`)
      const randomNumber = Math.floor(Math.random() * 90)
      document.body.style.setProperty(
        "--rotation",
        `${randomNumber % 2 === 0 ? randomNumber : -randomNumber}deg`
      )

      setTimeout(() => {
        document.body.classList.remove("hit")
      }, 200)
    } else {
      handleGameOver()
    }
  }

  const handleKeyDown = (e: KeyboardEvent, idx: number) => {
    if (e.key === "Enter") {
      handleMole(e, idx)
    }
  }
  let first = true
  useEffect(() => {
    if (first) {
      setMoles(initialState)
      first = false
    }
    const interval = setInterval(() => {
      const randomIndex = Math.floor(Math.random() * 9)

      setMoles((pvMoles) =>
        pvMoles.map((mole, id) =>
          id === randomIndex
            ? { ...mole, status: !mole.status }
            : { ...mole, status: false }
        )
      )
    }, 1000)
    return () => clearInterval(interval)
  }, [])
  return (
    <div className="app">
      <h1 className="high-score">High Score: {highScore}</h1>
      <h1 className="score">{score}</h1>
      <div className="grid">
        {moles.map((mole, idx) => (
          <img
            tabIndex={idx}
            onClick={(e) => handleMole(e, idx)}
            data-mole={mole}
            onKeyDown={(e) => handleKeyDown(e, idx)}
            src={mole.status ? molePic : holePic}
            alt={"mole-" + idx}
          />
        ))}
      </div>
    </div>
  )
}

export default App
