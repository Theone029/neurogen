from fastapi import FastAPI
from langchain_openai import ChatOpenAI
from langchain.schema import SystemMessage, HumanMessage

app = FastAPI()

llm = ChatOpenAI(model_name="gpt-4")

@app.get("/")
async def home():
    return {"status": "NEUROGEN ACTIVE"}

@app.get("/ask/{query}")
async def ask_ai(query: str):
    response = llm.predict_messages([
        SystemMessage(content="You are an AI financial strategist."),
        HumanMessage(content=query)
    ])
    return {"response": response.content}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
